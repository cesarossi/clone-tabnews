import database from "infra/database.js";

async function status(request, response) {
  const updatedAt = new Date().toISOString();
  const versionSQL = await database.query("SHOW server_version;");
  const maxConnections = await database.query("SHOW max_connections;");
  const dbName = process.env.POSTGRES_DB;
  const currentConnections = await database.query({
    text: "Select count(*)::int as count from pg_stat_activity WHERE datname=$1;",
    values: [dbName],
  });
  response.status(200).json({
    updated_at: updatedAt,
    dependencies: {
      database: {
        version: versionSQL.rows[0].server_version,
        max_connections: parseInt(maxConnections.rows[0].max_connections),
        opened_connections: currentConnections.rows[0].count,
      },
    },
  });
}

export default status;
