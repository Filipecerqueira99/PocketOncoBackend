module.exports = (sequelize, DataTypes) => {

    const Awards = sequelize.define("awards", {
        idAwards:{
            primaryKey: true,
            autoIncrement: true,
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            },
        },
        description:{
            type: DataTypes.STRING,
            allowNull: false,
            validate:{
                notEmpty: true
            }
        },
        goal:{
            type: DataTypes.INTEGER,
            allowNull: false,
            validate:{
                notEmpty: true
            }
        },
        category_id:{
            type: DataTypes.INTEGER,
            references: {
                model: 'questioncategories',
                key: 'idquestionCategory'
            },
            allowNull: false,
            validate:{
                notEmpty: true
            }
        },
    })

    return Awards
}