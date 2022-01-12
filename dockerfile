FROM strapi/base:12-alpine


# Set up working directory that will be used to copy files/directories below :
WORKDIR /app

# Copy package.json to root directory inside Docker container of Strapi app

COPY ./sw-cms/package.json .

# Copy yarn.lock to root directory inside Docker container of Strapi app

COPY ./sw-cms/yarn.lock .

# Install dependencies, but not generate a yarn.lock lockfile and fail if an update is needed.
RUN yarn --version

RUN yarn install

# == Copy required files ==

# In order to launch our Strapi app, we must import it into our image.

# We use the keyword ‘COPY’ to do that.

# The first parameter is the name of the file on the host.

# The second parameter is the path where to put the file on the image.

# ‘.’ or ‘/’ means the file will be put in the image root folder.

COPY ./sw-cms/favicon.ico .

COPY ./sw-cms/public/ public/

COPY ./sw-cms/extensions/ extensions/

COPY ./sw-cms/components/ components/

COPY ./sw-cms/api/ api/

COPY ./sw-cms/config/ config/


RUN yarn build

# Run on port 1337

EXPOSE 1337

# We need to define the command to launch when we are going to run the image.

# We use the keyword ‘CMD’ to do that.

# The following command will execute “yarn start”.

CMD ["yarn", "start"]
