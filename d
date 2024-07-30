[1mdiff --git a/infra/database.js b/infra/database.js[m
[1mindex 98d4ccf..f238c47 100644[m
[1m--- a/infra/database.js[m
[1m+++ b/infra/database.js[m
[36m@@ -7,13 +7,7 @@[m [masync function query(queryObject) {[m
     user: process.env.POSTGRES_USER,[m
     database: process.env.POSTGRES_DB,[m
     password: process.env.POSTGRES_PASSWORD,[m
[31m-  });[m
[31m-  console.log("Credenciais do Postgres: ", {[m
[31m-    host: process.env.POSTGRES_HOST,[m
[31m-    port: process.env.POSTGRES_PORT,[m
[31m-    user: process.env.POSTGRES_USER,[m
[31m-    database: process.env.POSTGRES_DB,[m
[31m-    password: process.env.POSTGRES_PASSWORD,[m
[32m+[m[32m    ssl: process.env.NODE_ENV === "development" ? false : true,[m
   });[m
 [m
   try {[m
