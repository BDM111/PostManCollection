# Use an official Node runtime as a parent image
FROM node:14

# Install Newman globally
RUN npm install -g newman

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Define a volume for storing HTML reports
VOLUME /usr/src/app/reports

# Command to run Newman and generate HTML reports
CMD ["newman", "run", "your_collection.json", "-r", "html", "--reporter-html-export", "reports/newman-report.html"]
