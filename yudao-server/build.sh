# !/bin/bash
# maven私库地址
repository_url="registry.cn-shenzhen.aliyuncs.com/caijh/"
# 镜像名称
server_name="yudao_server"
# 标签名称
server_tag_name="$repository_url$server_name"
tag_num="latest"
# 查看镜像id
IMG_ID=$(docker images | grep "$server_name" | awk '{print $3}')

if [ -n "$IMG_ID" ]
then
  echo "exists images id"
  echo "remove images"

# 循环遍历镜像id并进行删除
  for imgId in ${IMG_ID[@]}
  do
    echo "image id = $imgId"
  done
  docker rmi $server_name
  docker rmi $server_tag_name
else
  echo "not exists $IMG_ID image"
fi

# 重新构建新的镜像
echo "rebuild image"
docker build -t $server_name .

# 打标签
echo "image tag"
docker tag $server_name $repository_url$server_name:$tag_num
# 推送至服务器
echo "push image"
docker push $repository_url$server_name:$tag_num

