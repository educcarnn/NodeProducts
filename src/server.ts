import { AppDataSource } from "./data-source";
import app from "./app"


AppDataSource.initialize()
  .then(async () => {
    console.log("Database connected.")

    const PORT = 8080;
    app.listen(PORT, () => {
      console.log(`App is running on https://localhost:${PORT}`)
    })
  })
  .catch((err) => console.error(err));