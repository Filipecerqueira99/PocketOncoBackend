module.exports = (sequelize, DataTypes) => {

    const Missions = sequelize.define("mission", {
        idMission:{
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            },
        },
        user_id:{
            type: DataTypes.INTEGER,
            references: {
                model: 'users',
                key: 'idUser'
            },
            allowNull: false,
            validate:{
                notEmpty: false
            }
        },
        description:{
            type: DataTypes.STRING,
            allowNull: false,
            validate:{
                notEmpty: true
            },
            unique: false
        },
        current_value:{
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            },
            unique: false
        },
        goal:{
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            },
            unique: false
        },
        category_id:{
            type: DataTypes.INTEGER,
            references: {
                model: 'questioncategories',
                key: 'idquestionCategory'
            },
            allowNull: false,
            validate:{
                notEmpty: false
            }
        },
        completed:{
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            },
        },

    })

    return Missions
}