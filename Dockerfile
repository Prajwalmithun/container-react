FROM node:alpine
WORKDIR /var/app as teamalpha
COPY package.json .
RUN npm install
COPY . .
RUN npm run-script build


FROM nginx
EXPOSE 80
COPY --from=teamalpha /var/app/build /usr/share/nginx/html
CMD ["serve","-s","build"]
