'use strict';
const {SECRET = "secret", REFRESH_SECRET = "refresh_secret"} = process.env;
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const db = require('../models')
const permissionsController = require("./permissionController.dbops");

// Create main Model
const User = db.users
const UserFriendsRequests = db.userFriendsRequests
const UserFriends = db.userFriends
const Missions = db.missions
const Awards = db.awards
const AwardsUser = db.awardsuservalues
const QuestionCategory = db.questioncategories


// Main Work

// Test route
const rootHello = async (ctx) => {
    ctx.body = ctx.missions
}

//create daily missions
const createDailyMissions = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
        //description: ctx.request.body.description,
        //category_id: ctx.request.body.category_id,
    }
    let utc = new Date().toJSON().slice(0, 10).replace(/-/g, '/');
    console.log(utc);
    //SELECT * FROM `missions` WHERE `createdAt` > '2024-06-08 00:00:00'

    let missionsFound = await Missions.findAll({
        where: {
            user_id: info.idUser,
            completed: 0,
            //createdAt: new Date()//TODO: Trocar isto para dinamico para ir buscar as missões do próprio dia
        }
    });
    console.log(missionsFound.length)

    if (missionsFound.length >= 3) {
        ctx.body = "Missões já existentes";

    } else {
        for (let j = 0; j < 3 - missionsFound.length; j++) {
            let category_id = Math.floor(Math.random() * 9) + 1 //1 a 9
            let description = ""
            if (category_id == 1)
                description = "aaa"
            else if (category_id == 2)
                description = "aaa"
            else if (category_id == 3)
                description = "aaa"
            else if (category_id == 4)
                description = "aaa"
            else if (category_id == 5)
                description = "aaa"
            else if (category_id == 6)
                description = "aaa"
            else if (category_id == 7)
                description = "aaa"
            else if (category_id == 8)
                description = "aaa"
            else if (category_id == 9)
                description = "aaa"

            try {
                let infoToAdd = {
                    user_id: info.idUser,
                    description: description,
                    current_value: 0,
                    goal: Math.floor(Math.random() * 5 + 1),
                    category_id: category_id,
                    completed: 0,
                }

                const missionsCreated = await Missions.create(infoToAdd)
                ctx.body = "Missões criadas";

            } catch (e) {
                ctx.body = "Error: Something went wrong"
                console.log(e)
            }

        }
    }
};

// update daily mission
const updateDailyMission = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
        category_id: ctx.request.body.category_id,
    }
    try {
        //confirmar se não acontece ter mais que uma missão da mesma categoria e oque acontece nesse caso
        let missionsFound = await Missions.findAll({
            where: {
                user_id: info.idUser,
                category_id: info.category_id,
            }
        });
        if(missionsFound.length > 0){
            if (missionsFound[0].dataValues.current_value + 1 >= missionsFound[0].dataValues.goal) {
                const missionCompleted = await Missions.update(
                    {
                        current_value: missionsFound[0].dataValues.current_value + 1,
                        completed: 1,
                    }, {
                        where: {
                            idMission: missionsFound[0].dataValues.idMission,
                        }
                    });
                ctx.body = "Missão concluida!"
            } else {
                const missionCompleted = await Missions.update(
                    {
                        current_value: missionsFound[0].dataValues.current_value + 1,
                    }, {
                        where: {
                            idMission: missionsFound[0].dataValues.idMission,
                        }
                    });
                ctx.body = "Mais um ponto na missão!"
            }
        }else{
            ctx.body = "Sem missões para esta temática!"

        }



    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

//get daily missions
const getDailyMissions = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
    }
    console.log(info.idUser)
    try {
        let missionsFound = await Missions.findAll({
            where: {
                user_id: info.idUser,
                //createdAt:  "2024-06-06"//TODO: Trocar isto para dinamico para ir buscar as missões do próprio dia
            }
        });
        console.log(missionsFound)

        if (missionsFound) {
            ctx.body = missionsFound;
        } else {
            ctx.body = "Missões não encontradas";
        }

    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

//create user awards
const createUserAwards = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
    }

    try {
        const awardsFound = await AwardsUser.findOne({
            where: {
                user_id: info.idUser,
            }
        });
        if(awardsFound){
            ctx.body = "Já tinha conquistas!";

        }else{
            for (let i = 1; i <= 9; i++) {
                let infoToAdd = {
                    current_value: 0,
                    user_id: info.idUser,
                    category_id: i,
                }

                const awardsCreated = await AwardsUser.create(infoToAdd)
            }


            ctx.body = "Conquistas criadas";
        }


    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

//update user awards
const updateUserAwards = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
        category_id: ctx.request.body.category_id,
        points: ctx.request.body.points,
    }

    try {
        let userAwardsFound = await AwardsUser.findOne({
            where: {
                user_id: info.idUser,
                category_id: info.category_id,
            }
        });

        let infoToAdd = {
            current_value: userAwardsFound.dataValues.current_value + info.points,
        }

        const awardsCreated = await AwardsUser.update(
            {
                current_value: infoToAdd.current_value,
            }, {
                where: {
                    user_id: info.idUser,
                    category_id: info.category_id,
                }
            });

        /*for (let index = 0; index < userAwardsFound.length; index++) {
            const awardsFound = await Awards.findOne({
                where: {
                    idAwards: userAwardsFound[index].dataValues.award_id,
                }
            });
            userAwardsFound[index].dataValues.description = awardsFound.dataValues.description;
            userAwardsFound[index].dataValues.goal = awardsFound.dataValues.goal;
            userAwardsFound[index].dataValues.category_id = awardsFound.dataValues.category_id;
        }

        for (let index = 0; index < userAwardsFound.length; index++) {
            const categoryFound = await QuestionCategory.findOne({
                where: {
                    idquestionCategory: userAwardsFound[index].dataValues.category_id,
                }
            });
            userAwardsFound[index].dataValues.categoryName = categoryFound.dataValues.name;
        }

        console.log(userAwardsFound)*/

        if (awardsCreated) {
            ctx.body = "Conquista atualizada!";
        } else {
            ctx.body = "Conquistas não encontradas";
        }

    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

//get user awards
const getUserAwards = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
    }

    try {
        let userAwardsFound = await AwardsUser.findAll({
            where: {
                user_id: info.idUser,
            }
        });

        for (let index = 0; index < userAwardsFound.length; index++) {
            /*const awardsFound = await Awards.findOne({
                where: {
                    idAwards: userAwardsFound[index].dataValues.award_id,
                }
            }); Iniciante, Intermediário, Perito, Mestre*/
            if(userAwardsFound[index].dataValues.current_value <= 19){
                userAwardsFound[index].dataValues.levelDesc = "Iniciante";
                userAwardsFound[index].dataValues.goal = 20;
            }else if(userAwardsFound[index].dataValues.current_value <= 99){
                userAwardsFound[index].dataValues.levelDesc = "Intermediário";
                userAwardsFound[index].dataValues.goal = 100;
            }else if(userAwardsFound[index].dataValues.current_value <= 199){
                userAwardsFound[index].dataValues.levelDesc = "Perito";
                userAwardsFound[index].dataValues.goal = 200;
            }else if(userAwardsFound[index].dataValues.current_value <= 349){
                userAwardsFound[index].dataValues.levelDesc = "Mestre";
                userAwardsFound[index].dataValues.goal = 350;
            }else{
                userAwardsFound[index].dataValues.levelDesc = "Mestre";
                userAwardsFound[index].dataValues.goal = userAwardsFound[index].dataValues.current_value;
            }

            const categoryFound = await QuestionCategory.findOne({
                where: {
                    idquestionCategory: userAwardsFound[index].dataValues.category_id,
                }
            });
            console.log(categoryFound)

            userAwardsFound[index].dataValues.categoryName = categoryFound.dataValues.name;
            //console.log(userAwardsFound[index].dataValues.categoryName)

        }

        /*for (let index = 0; index < userAwardsFound.length; index++) {
            const categoryFound = await QuestionCategory.findOne({
                where: {
                    idquestionCategory: userAwardsFound[index].dataValues.category_id,
                }
            });
            userAwardsFound[index].dataValues.categoryName = categoryFound.dataValues.name;
        }

        console.log(userAwardsFound)*/

        if (userAwardsFound.length > 0) {
            ctx.body = userAwardsFound;
        } else {
            ctx.body = "Conquistas não encontradas";
        }

    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};


module.exports = {
    rootHello,
    createDailyMissions,
    updateDailyMission,
    getDailyMissions,
    getUserAwards,
    updateUserAwards,
    createUserAwards,
}
