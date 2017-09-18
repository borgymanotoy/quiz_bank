package com.borgymanotoy.samples;

import com.borgymanotoy.samples.controller.ProjectController;
import com.borgymanotoy.samples.controller.ProjectRestController;
import java.io.IOException;

import static spark.Spark.*;

public class QuizBankApplication {

    private final static String DB_CONNSTR_LOCAL = "mongodb://localhost/db_quiz_bank";

    public static void main(String[] args) throws IOException {
        port(getHerokuAssignedPort());
        staticFileLocation("/public");
        if (args.length == 0) {
            new ProjectController(DB_CONNSTR_LOCAL);
            new ProjectRestController(DB_CONNSTR_LOCAL);
        }
        else {
            new ProjectController(args[0]);
            new ProjectRestController(args[0]);
        }
    }

    static int getHerokuAssignedPort() {
        ProcessBuilder processBuilder = new ProcessBuilder();
        if (processBuilder.environment().get("PORT") != null) {
            return Integer.parseInt(processBuilder.environment().get("PORT"));
        }
        return 4567; //return default port if heroku-port isn't set (i.e. on localhost)
    }
}
