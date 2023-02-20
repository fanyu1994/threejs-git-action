echo  -e "------------登陆镜像服务器---------------"
docker login --username=$1 registry.cn-hangzhou.aliyuncs.com --password=$2

echo -e "-------------停止容器-----------------"
docker stop fy-three

echo -e "-------------删除容器----------------"
docker rm fy-three

echo -e "-------------删除镜像------------------"
docker rmi registry.cn-hangzhou.aliyuncs.com/fanyu1994/fy-three:latest

echo -e "-------------拉新的镜像--------------"
docker pull registry.cn-hangzhou.aliyuncs.com/fanyu1994/fy-three:latest

echo -e "-----------------构建镜像-----------------"
docker run --rm -d --name fy-three -p 8787:80 registry.cn-hangzhou.aliyuncs.com/fanyu1994/fy-three:latest
echo -e "-------------------构建镜像完毕-----------------"