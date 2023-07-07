{
echo '   <!DOCTYPE html>'
echo '    <html lang="ru">'
echo '    <head>'
echo '        <meta charset="UTF-8">'
echo '        <title>NGINX</title>'
echo '    </head>'
echo '    <body>'
echo '        <h2>Дипломная работа</h2>'
echo '        <img src="main.jpg" name="Велосипеды" align="center" width="600" height="350"  border="0"/>' 
echo '        <h4>Автор: Турганов Артем</h4>'
echo "        <h4>$1</h4>"
echo '    </body>'
echo '    </html>'
}> ./nginx/index.html