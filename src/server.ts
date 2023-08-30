import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import { Client } from "pg";
import { getEnvVarOrFail } from "./support/envVarUtils";
import { setupDBClientConfig } from "./support/setupDBClientConfig";

dotenv.config(); //Read .env file lines as though they were env vars.

const dbClientConfig = setupDBClientConfig();
const client = new Client(dbClientConfig);

//Configure express routes
const app = express();

app.use(express.json()); //add JSON body parser to each following route handler
app.use(cors()); //add CORS support to each following route handler

app.get("/", async (_req, res) => {
    res.json({ msg: "There's nothing interesting for GET /" });
});

app.get("/pastes", async (_req, res) => {
    try {
        //For this to be successful, must connect to db
        const text = "select * from pastes";
        const response = await client.query(text);
        res.status(200).json(response.rows);
    } catch (error) {
        //Recover from error rather than letting system halt
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.get("/pastes/:id", async (req, res) => {
    try {
        const id = req.params.id;
        const text = "select * from pastes where id = $1";
        const values = [id];
        const response = await client.query(text, values);
        res.status(200).json(response.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.get("/pastes/recent/:amount", async (req, res) => {
    try {
        const amount = req.params.amount;
        const text =
            "select * from pastes order by creation_date desc limit $1";
        const values = [amount];
        const response = await client.query(text, values);
        res.status(200).json(response.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

app.post("/pastes", async (req, res) => {
    try {
        const { title, description } = req.body;
        const text =
            "insert into pastes (title, description) values ($1, $2) returning *";
        const values = [title, description];
        const newPastes = await client.query(text, values);
        res.status(201).json(newPastes.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send("An error occurred. Check server logs.");
    }
});

connectToDBAndStartListening();

async function connectToDBAndStartListening() {
    console.log("Attempting to connect to db");
    await client.connect();
    console.log("Connected to db!");

    const port = getEnvVarOrFail("PORT");
    app.listen(port, () => {
        console.log(
            `Server started listening for HTTP requests on port ${port}.  Let's go!`
        );
    });
}
