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
    ctx.body = ctx.user
}

// Adds a user to the DB. Usernames have to be unique
const signUp = async (ctx) => {
    console.log("chegou")
    console.log(ctx.request.body)
    try {
        //let validInputsErrors = await validateInputSignUp(ctx.request.body.email, ctx.request.body.password)

        //if (validInputsErrors == "") {
        let info = {
            email: ctx.request.body.email,
            password: await bcrypt.hash(ctx.request.body.password, 10),
            first_name: ctx.request.body.first_name,
            last_name: ctx.request.body.last_name,
            age: ctx.request.body.age,
            streak: 1,
            points: 0,
            level: 1,
            weekly_points: 0,
            img: "img1",
        }
        console.log(info)
        const userCreated = await User.create(info)
        ctx.body = userCreated
        /*} else {
            ctx.body = validInputsErrors
            console.log("validInputsErrors: " + validInputsErrors);
        }*/
    } catch (e) {
        ctx.body = "Error: Something went wrong with the users' signup"
        console.log(e)
    }

};

// Verifies if the user exists on the DB with the incerted password
const login = async (ctx) => {
    console.log("LOGIN FUNCT")
    let info = {
        email: ctx.request.body.email,
        password: ctx.request.body.password,
    }
    try {
        let userFound = await User.findOne({where: {email: info.email}});
        if (userFound != null) {
            const idUser = userFound.idUser
            const samePass = await bcrypt.compare(info.password, userFound.password);
            if (samePass) {
                const accessToken = await generateAccessToken(info.email, idUser);
                const refreshToken = await generateRefreshToken(info.email, idUser);
                ctx.body = {
                    message: "User Logged In!",
                    accessToken: accessToken,
                    refreshToken: refreshToken,
                    email: info.email,
                    idUser: userFound.idUser,
                    first_name: userFound.first_name,
                    last_name: userFound.last_name,
                    age: userFound.age,
                    streak: userFound.streak,
                    points: userFound.points,
                    level: userFound.level,
                    img: userFound.img,
                };
            } else {
                ctx.body = {message: "Wrong Password.", accessToken: " ", refreshToken: " ", email: info.email};
            }
        } else {
            ctx.body = {message: "User does not exist.", accessToken: " ", refreshToken: " ", email: info.email};
        }
    } catch (e) {
        ctx.body = "Error: Something went wrong with the users' login"
        console.log(e)
    }
};

//editar utilizador
const editProfile = async (ctx) => {
    console.log("chegou")
    console.log(ctx.request.body)
    try {
        //let validInputsErrors = await validateInputSignUp(ctx.request.body.email, ctx.request.body.password)

        //if (validInputsErrors == "") {

        if (ctx.request.body.currentPassword != "") {
            console.log("Alterou a password.")
            let info = {
                idUser: ctx.request.body.idUser,
                email: ctx.request.body.email,
                currentPassword: await bcrypt.hash(ctx.request.body.currentPassword, 10),
                newPassword: await bcrypt.hash(ctx.request.body.newPassword, 10),
                first_name: ctx.request.body.first_name,
                last_name: ctx.request.body.last_name,
                age: ctx.request.body.age,
            }


            let userFound = await User.findOne({where: {email: info.email}});
            if (userFound.password == info.currentPassword) {
                console.log(info)
                const userUpdated = await User.update(
                    {
                        email: info.email,
                        password: info.newPassword,
                        first_name: info.first_name,
                        last_name: info.last_name,
                        age: info.age,
                    },
                    {where: {idUser: info.idUser}})

                ctx.body = userUpdated
            } else {
                ctx.body = "Current Password está errada."
            }
        } else {
            console.log("Não alterour password.")
            let info = {
                idUser: ctx.request.body.idUser,
                email: ctx.request.body.email,
                first_name: ctx.request.body.first_name,
                last_name: ctx.request.body.last_name,
                age: ctx.request.body.age,
            }

            const userUpdated = await User.update(
                {
                    email: info.email,
                    first_name: info.first_name,
                    last_name: info.last_name,
                    age: info.age,
                },
                {where: {idUser: info.idUser}})
            ctx.body = userUpdated
        }
    } catch (e) {
        ctx.body = "Error: Something went wrong with the users' signup"
        console.log(e)
    }

};

// Get user weekly information and friends information
const getScoreboardInfo = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
    }
    try {
        let userFound = await User.findAll({where: {level: 1}});
        console.log(userFound)
        if (userFound != null) {
            ctx.body = {
                userFound
            };
        } else {
            ctx.body = "Error: Não encontrou nenhum"
        }

        //ir buscar info dos amigos
    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

// User send friend requests
const sendFriendRequest = async (ctx) => {
    let info = {
        idUser1: ctx.request.body.idUser1,
        email: ctx.request.body.email,
    }
    try {
        let userFound = await User.findOne({where: {email: info.email}});

        let infoToAdd = {
            idUser1: ctx.request.body.idUser1,
            idUser2: userFound.idUser,
        }

        let friendshipFound = await UserFriends.findOne({
            where: {
                idUser1: infoToAdd.idUser1,
                idUser2: infoToAdd.idUser2,
            }
        });

        if (!friendshipFound) {
            let requestFound = await UserFriendsRequests.findOne({
                where: {
                    idUser1: infoToAdd.idUser1,
                    idUser2: infoToAdd.idUser2,
                }
            });

            //console.log(requestFound)
            if (requestFound) {
                ctx.body = "Pedido já enviado!"
            } else {
                const userCreated = await UserFriendsRequests.create(infoToAdd)
                ctx.body = "Pedido de amizade enviado!"
            }
        } else {
            ctx.body = "Já são amigos!"

        }


    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

// User get friend requests
const getFriendRequest = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
    }
    console.log(info.idUser)
    try {
        let requestsFound = await UserFriendsRequests.findAll({
            where: {
                idUser1: info.idUser,
            }
        });
        console.log(requestsFound)
        if (requestsFound) {
            for (let index = 0; index < requestsFound.length; index++) {
                const userInfo = await User.findOne({
                    where: {
                        idUser: requestsFound[index].dataValues.idUser2,
                    },
                });
                requestsFound[index].dataValues.email = userInfo.dataValues.email;
            }
            ctx.body = requestsFound;
            console.log(requestsFound)
        } else {
            ctx.body = "";
        }

    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

//get getFriendsLevelPoints levels and points
const getFriendsLevelPoints = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
    }

    try {
        let friendsFound = await UserFriends.findAll({
            where: {
                idUser1: info.idUser,
            }
        });
        console.log(friendsFound)
        if (friendsFound) {
            for (let index = 0; index < friendsFound.length; index++) {
                const userInfo = await User.findOne({
                    where: {
                        idUser: friendsFound[index].dataValues.idUser2,
                    }
                });
                friendsFound[index].dataValues.name = userInfo.dataValues.first_name;
                friendsFound[index].dataValues.level = userInfo.dataValues.level;
                friendsFound[index].dataValues.streak = userInfo.dataValues.streak;
                friendsFound[index].dataValues.img = userInfo.dataValues.img;
            }

            ctx.body = friendsFound;
            console.log(friendsFound)
        } else {
            ctx.body = "";
        }

    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

//get friends weekly results for scoreboard
const getFriendsWeeklyResults = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
    }
    console.log(info.idUser)
    try {
        let friendsFound = await UserFriends.findAll({
            where: {
                idUser1: info.idUser,
            }
        });
        console.log(friendsFound)
        if (friendsFound) {
            for (let index = 0; index < friendsFound.length; index++) {
                const userInfo = await User.findOne({
                    where: {
                        idUser: friendsFound[index].dataValues.idUser2,
                    }
                });
                friendsFound[index].dataValues.name = userInfo.dataValues.first_name + " " + userInfo.dataValues.last_name;
                friendsFound[index].dataValues.weekly_points = userInfo.dataValues.weekly_points;
            }


            ctx.body = friendsFound;
            console.log(friendsFound)
        } else {
            ctx.body = "";
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

//get daily missions
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

        console.log(userAwardsFound)

        if (userAwardsFound) {
            ctx.body = userAwardsFound;
        } else {
            ctx.body = "Conquistas não encontradas";
        }

    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

//get new sugested users to add as friends
const getSugestedNewFriends = async (ctx) => {
    let info = {
        idUser: ctx.request.body.idUser,
    }

    try {
        let userFriends = await UserFriends.findAll({
            where: {
                idUser1: info.idUser,
            }
        });

        let allUsers = await User.findAll({});
        //console.log(userFriends)

        for (let index = 0; index < userFriends.length; index++) {
            for (let j = 0; j < allUsers.length; j++) {
                delete allUsers[j].dataValues.password
                delete allUsers[j].dataValues.email
                if (userFriends[index].dataValues.idUser2 == allUsers[j].dataValues.idUser) {
                    console.log(allUsers[j].dataValues.email)
                    allUsers.splice(j, 1)
                } else if (allUsers[j].dataValues.idUser == info.idUser) {
                    allUsers.splice(j, 1)
                }
            }
        }

        if (allUsers.length > 6) {
            for (let j = 6; j < allUsers.length; j++) {
                allUsers.splice(j, 1)
            }
        }

        console.log(allUsers)

        if (userFriends) {
            ctx.body = allUsers;
        } else {
            ctx.body = "Conquistas não encontradas";
        }

    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

//editar imagem de perfil do utilizador
const editImgProfile = async (ctx) => {
    try {
        let info = {
            idUser: ctx.request.body.idUser,
            img: ctx.request.body.img,
        }

        const userUpdated = await User.update(
            {
                img: info.img,
            },
            {where: {idUser: info.idUser}})

        ctx.body = "Imagem atualizada!"

    } catch (e) {
        ctx.body = "Error: Something went wrong with the users' signup"
        console.log(e)
    }

};

// User add friend approved
const addFriend = async (ctx) => {
    let info = {
        idUser1: ctx.request.body.idUser1,
        email: ctx.request.body.email,
    }
    try {
        let userFound = await User.findOne({where: {email: info.email}});

        let infoToAdd = {
            idUser1: ctx.request.body.idUser1,
            idUser2: userFound.idUser,
        }

        let requestFound = await UserFriends.findOne({
            where: {
                idUser1: infoToAdd.idUser1,
                idUser2: infoToAdd.idUser2,
            }
        });

        if (requestFound) {
            ctx.body = "Amigo já adicionado!"
        } else {
            const friendCreated = await UserFriends.create(infoToAdd)

            let infoToAdd2 = {
                idUser2: ctx.request.body.idUser1,
                idUser1: userFound.idUser,
            }

            const friendCreated2 = await UserFriends.create(infoToAdd2)


            const friendRequestDeleted = await UserFriendsRequests.update(
                {
                    idUser1: -1,
                    idUser2: -1,
                }, {
                    where: {
                        idUser1: infoToAdd.idUser1,
                        idUser2: infoToAdd.idUser2,
                    }
                });
            ctx.body = "Amigo adicionado!"
        }


    } catch (e) {
        ctx.body = "Error: Something went wrong"
        console.log(e)
    }
};

const refreshUser = async (ctx) => {
    const {authorization} = ctx.headers;

    const refreshToken = authorization.split(" ")[1]; //split the header and get the refresh token

    // If no refresh token is found, return an error
    if (!refreshToken) {
        return ctx.body = 'Refresh token not found'
    }

    try {
        const claims = await jwt.verify(refreshToken, REFRESH_SECRET)
        //if claim does not exist
        if (!claims) {
            ctx.throw(401);
        }
        const accessToken = await generateAccessToken(claims.email, claims.idUser);

        ctx.body = {accessToken: accessToken};

    } catch (err) {
        console.log(err)
        ctx.throw(401);
    }
}

// Function to generate an access token
const generateAccessToken = async (email, idUser) => {
    const accessToken = await jwt.sign({email: email, idUser: idUser}, SECRET, {expiresIn: '10m'});
    return accessToken;
}

// Function to generate a refresh token
const generateRefreshToken = async (email, idUser) => {
    const refreshToken = await jwt.sign({email: email, idUser: idUser}, REFRESH_SECRET);
    return refreshToken;
}

// Returns all users from the DB
const getUsers = async (ctx) => {
    try {
        let users = await User.findAll();
        ctx.body = users;
    } catch (e) {
        ctx.body = "Error: Something went wrong while getting all users."
        console.log(e)
    }
}

// Gets a specific user from the DB
const getUser = async (ctx) => {
    let idUser = ctx.params.idUser;
    try {
        let userFound = await User.findOne({where: {idUser: idUser}});
        if (userFound != null) {
            ctx.body = userFound
        } else {
            ctx.body = "User doesn't exist."
        }
    } catch (e) {
        ctx.body = "Error: Something went wrong while getting the specified user."
        console.log(e)
    }
}


async function validateInputSignUp(email, password) {
    let error = "";

    // Validates if password has a minimum length of 6, if it has upper and lowercase, numbers and special characters
    if (password.length < 6) {
        console.log("less than 6");
        error += "Password should have at least 6 characters.\n"
    }
    if (!(/[a-z]/.test(password))) {
        console.log("pass");
        error += "Password should have at least 1 Lower case.\n"
    }
    if (!(/[A-Z]/.test(password))) {
        console.log("pass2");
        error += "Password should have at least 1 Upper case.\n"
    }
    if (!(/[^a-zA-Z0-9]/.test(password))) {
        console.log("pass3");
        error += "Password should have at least 1 special character.\n"
    }
    if (!(/\d/.test(password))) {
        console.log("pass4");
        error += "Password should have at least 1 number.\n"
    }

    let user = await User.findOne({where: {email: email}});
    if (user != null) {
        console.log("pass5");
        error += "Username already reserved. \n"
    }

    return error;
}


// Updtes User Points when he finishes a game
const updateUserPoints = async (ctx) => {
    let idUser = ctx.params.idUser;
    let points = ctx.request.body.points;
    let level = ctx.request.body.level;

    if (points >= 100) {
        points = 0;
        try {
            const levelUpdated = await User.update(
                {level: level + 1, points: 0},
                {where: {idUser: idUser}}
            );
            ctx.body = "Parabéns subiste de nível! 🚀";
        } catch (e) {
            ctx.body = "Something went wrong when updating the user level.";
            console.log(e);
        }
    } else {
        try {
            const pointsUpdated = await User.update(
                {points: points},
                {where: {idUser: idUser}}
            );
            ctx.body = points;
            /*if (points > 0) {
                ctx.body = "Recebeste " + points + " pontos! Continua assim! 🎆";
            } else {
                ctx.body = "Recebeste 0 pontos! Na próxima certamente vai correr melhor! 🍀";
            }*/

        } catch (e) {
            ctx.body = "Something went wrong when updating the user points.";
            console.log(e);
        }
    }

}

// Updtes User Days (Streak) when he finishes a game
const updateUserStreak = async (ctx) => {
    let idUser = ctx.params.idUser;
    let streak = ctx.request.body.streak;
    try {
        const streakUpdated = await User.update(
            {streak: streak},
            {where: {idUser: idUser}}
        );
        ctx.body = streakUpdated;
    } catch (e) {
        ctx.body = "Something went wrong when updating the user streak.";
        console.log(e);
    }
}

// Updtes User Level when he finishes a game
const updateUserLevel = async (ctx) => {
    let idUser = ctx.params.idUser;
    let level = ctx.request.body.level;
    try {
        const levelUpdated = await User.update(
            {level: level},
            {where: {idUser: idUser}}
        );
        ctx.body = levelUpdated;
    } catch (e) {
        ctx.body = "Something went wrong when updating the user level.";
        console.log(e);
    }
}


module.exports = {
    rootHello,
    signUp,
    login,
    editProfile,
    getScoreboardInfo,
    sendFriendRequest,
    getFriendRequest,
    addFriend,
    getFriendsLevelPoints,
    getFriendsWeeklyResults,
    getSugestedNewFriends,
    getUserAwards,
    getDailyMissions,
    editImgProfile,
    getUsers,
    getUser,
    refreshUser,
    updateUserPoints,
    updateUserStreak,
    updateUserLevel
}
