# Timezone

```shell
dpkg-reconfigure tzdata
dpkg-reconfigure locales

echo "" >> .bashrc
echo "export LC_ALL=zh_TW.UTF-8" >> .bashrc
echo "export LANG=zh_TW.UTF-8" >> .bashrc
echo "export LANGUAGE=zh_TW.UTF-8" >> .bashrc
echo "export TZ='Asia/Taipei'" >> .bashrc
```
