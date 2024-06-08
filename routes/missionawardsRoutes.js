const KoaRouter = require('koa-router');
const missionawardsController = require('../controllers/missionawards.dbops');
const jwtVerifier = require("../helpers/jwtVerifier")
const RateLimit = require('koa2-ratelimit').RateLimit;

const missionawardsRouter = new KoaRouter();
const publicMissionawardsRouter = new KoaRouter();


missionawardsRouter.use(jwtVerifier)

// Routing REST requests
missionawardsRouter
    .get('/', missionawardsController.rootHello)

publicMissionawardsRouter
    .post('/missionawards/createDailyMissions', missionawardsController.createDailyMissions)
    .post('/missionawards/updateDailyMission', missionawardsController.updateDailyMission)
    .post('/missionawards/getDailyMissions', missionawardsController.getDailyMissions)

    .post('/missionawards/createUserAwards', missionawardsController.createUserAwards)
    .post('/missionawards/updateUserAwards', missionawardsController.updateUserAwards)
    .post('/missionawards/getUserAwards', missionawardsController.getUserAwards)

module.exports = {missionawardsRouter, publicMissionawardsRouter};
