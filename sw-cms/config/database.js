module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
   default: {
    connector: 'mongoose',
    settings: {
      host: env('DB_MONGO_URL', '127.0.0.1'),
      srv: env.bool('DATABASE_SRV', false),
      port: env.int('DB_PORT', 27017),
      database: env('DATABASE_NAME', 'sw-strapi'),
      username: env('DB_USER_NAME', null),
      password: env('DB_PASSWORD', null)
    },
    options: {
      authenticationDatabase: env('AUTHENTICATION_DATABASE', null),
      ssl: env.bool('DB_SSL_ENABLE', false),
    },
   },
 },
});
