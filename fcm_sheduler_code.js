equire("dotenv").config();
const express = require("express");
const admin = require("firebase-admin");
const cron = require("node-cron");



admin.initializeApp({
    credential: admin.credential.cert({
        projectId: process.env.FIREBASE_PROJECT_ID,
        private_key: process.env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, "\n"),
        client_email: process.env.FIREBASE_CLIENT_EMAIL,
    }),
});


const db = admin.firestore();
const messaging = admin.messaging();


const scheduledNotifications = {};



const app = express();

app.use(express.json());

// Listen for new Firestore inserts
async function checkFirestore() {
    const snapshot = await db.collection("notifications").where("sent", "==", false).get();

    snapshot.forEach((doc) => {
        const data = doc.data();

        const { scheduledTime } = data;
        const docId = doc.id;

        //scheduleNotification(userId, scheduledTime, docId);


        //scheduleNotification(userId, scheduledTime, docId);
    });
}

async function sendNotification(title, body, token) {
    try {
        await wait(60000);
        const message = {
            notification: {
                title: title,
                body: body
            },
            token: token
        }

        const result = await messaging.send(message);
        console.log(result);

    } catch (error) {
        console.log(error);

        throw error;


    }

}

app.get("/", (req, res) => {
    res.send("Welcome");
})


app.post("/", async (req, res) => {
    try {
        const { title, body, token } = req.body;
        console.log(title);
        console.log(body);

        //await wait(60000);

        sendNotification(title, body, token)
        res.send("Notification send succesfully");
    } catch (e) {
        console.log(e);
        res.status(500).send("Error sending message")

    }
})

app.listen(3000, () => console.log("App is listening on port:3000"));

function wait(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}
