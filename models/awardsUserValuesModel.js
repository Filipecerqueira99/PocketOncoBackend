module.exports = (sequelize, DataTypes) => {

    const AwardsUserValues = sequelize.define("awardsuservalues", {
        idAwardsUserValues:{
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            },
        },
        current_value:{
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            }
        },
        user_id:{
            type: DataTypes.INTEGER,
            references: {
                model: 'users',
                key: 'idUser'
            },
            allowNull: false,
            validate:{
                notEmpty: true
            }
        },
        category_id:{
            type: DataTypes.INTEGER,
            references: {
                model: 'questionCategories',
                key: 'idquestionCategory'
            },
            allowNull: false,
            validate:{
                notEmpty: true
            }
        },
    })

    return AwardsUserValues
}