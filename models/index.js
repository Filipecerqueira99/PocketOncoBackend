'use strict';

const fs = require('fs');
const path = require('path');
const Sequelize = require('sequelize');
const process = require('process');
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/../config/config.json')[env];
const db = {};

let sequelize;
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(config.database, config.username, config.password, config);
}

fs
  .readdirSync(__dirname)
  .filter(file => {
    return (
      file.indexOf('.') !== 0 &&
      file !== basename &&
      file.slice(-3) === '.js' &&
      file.indexOf('.test.js') === -1
    );
  })
  .forEach(file => {
    const model = require(path.join(__dirname, file))(sequelize, Sequelize.DataTypes);
    db[model.name] = model;
  });

Object.keys(db).forEach(modelName => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

db.users = require('./UsereModel.js')(sequelize, Sequelize.DataTypes)
db.questiontypes = require('./questionTypeModel.js')(sequelize, Sequelize.DataTypes)
db.questioncategories = require('./questionCategoryModel.js')(sequelize, Sequelize.DataTypes)
db.performances = require('./performanceModel.js')(sequelize, Sequelize.DataTypes)
db.questions = require('./questionModel.js')(sequelize, Sequelize.DataTypes)
db.userconditions = require('./userConditionModel.js')(sequelize, Sequelize.DataTypes)
db.userFriends = require('./userFriendsModel.js')(sequelize, Sequelize.DataTypes)
db.userFriendsRequests = require('./userFriendsRequestsModel.js')(sequelize, Sequelize.DataTypes)
db.missions = require('./missionsModel.js')(sequelize, Sequelize.DataTypes)
db.awards = require('./awardsModel.js')(sequelize, Sequelize.DataTypes)
db.awardsuservalues = require('./awardsUserValuesModel.js')(sequelize, Sequelize.DataTypes)


module.exports = db;
