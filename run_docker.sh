npm run build
docker build -t monitor_data_img .
docker kill monitor_data
docker rm monitor_data
docker run -d --name monitor_data -p 9004:80 monitor_data_img
docker rmi monitor_data_img
