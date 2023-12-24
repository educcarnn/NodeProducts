import express from "express";
import cors from "cors";
import router from "./routes/routes";

const app = express();

app.use(express.json());
app.use(cors()); 

const origensPermitidas = [
    'http://localhost:3000',
    'http://localhost:8080',
]; 

app.use((req, res, next) => {
    const origem = req.get('origin');

    if (origensPermitidas.includes(origem as string)) {
        res.setHeader('Access-Control-Allow-Origin', origem as string);
    }

    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization");
    res.header('Access-Control-Allow-Methods', 'GET,HEAD,PUT,PATCH,POST,DELETE');

    next();
});

app.use("/", router);

export default app;
