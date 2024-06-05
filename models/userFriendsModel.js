module.exports = (sequelize, DataTypes) => {

    const UserFriends = sequelize.define("userfriends", {
        idUserFriends:{
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            },
        },
        idUser1:{
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            },
        },
        idUser2:{
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            }
        },
    })

    return UserFriends
}