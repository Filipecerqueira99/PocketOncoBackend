const KoaRouter = require('koa-router');
const userController = require('../controllers/userController.dbops');
const jwtVerifier = require("../helpers/jwtVerifier")
const RateLimit = require('koa2-ratelimit').RateLimit;

const userRouter = new KoaRouter();
const publicUserRouter = new KoaRouter();

const SignInlimiter = RateLimit.middleware({
    interval: {min: 5}, // 15 minutes = 15*60*1000
    max: 10, // start blocking after 10 requests
    message: "You have tried too many times to connect to API within 5 minutes. Please try again later.",
});

userRouter.use(jwtVerifier)

// Routing REST requests
userRouter
    .get('/', userController.rootHello)
//.get('/users', userController.getUsers)
//.get('/users/:idUser', userController.getUser)

publicUserRouter
    .post('/users/login', SignInlimiter, userController.login)
    .post('/users/signup', userController.signUp)
    .post('/users/editprofile', userController.editProfile)
    .get('/users/getScoreboardInfo', userController.getScoreboardInfo)
    .post('/users/sendFriendRequest', userController.sendFriendRequest)
    .post('/users/getFriendRequest', userController.getFriendRequest)
    .post('/users/addFriend', userController.addFriend)
    .post('/users/getFriendsLevelPoints', userController.getFriendsLevelPoints)
    .post('/users/getFriendsWeeklyResults', userController.getFriendsWeeklyResults)
    .post('/users/getSugestedNewFriends', userController.getSugestedNewFriends)
    .post('/users/editImgProfile', userController.editImgProfile)
    .post('/users/updateStreakAndToday', userController.updateStreakAndToday)
    .post('/users/getUserSymptoms', userController.getUserSymptoms)
    .post('/users/createUserConditions', userController.createUserConditions)

    .post('/users/updateToNewPassword', userController.updateToNewPassword)
    .post('/users/updatePasswordReset', userController.updatePasswordReset)



    .post('/users/refresh-token', userController.refreshUser)
    .post('/users/updateUserPoints/:idUser', userController.updateUserPoints)
    .post('/updateUserStreak/:idUser:streak', userController.updateUserStreak)
    .post('/updateUserLevel/:idUser:level', userController.updateUserLevel)

module.exports = {userRouter, publicUserRouter};
