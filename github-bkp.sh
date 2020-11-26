# curl \
#   -H "Accept: application/vnd.github.v3+json" \
#   -u <USERNAME>:<PASSWORD> \
#   https://api.github.com/user/repos?per_page=100 | grep clone

dirdate=$(date +%Y-%m-%d_%H-%M-%S)
cld=github-$dirdate

mkdir $cld
cd $cld

git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/.dotfiles.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/3DEtools.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/algorithms.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/AutoORM.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/bashXmpls.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/BeeMSee.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/BeGuide2Django.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/blog.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/code-dump.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/collectionsInterpreter.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/CS50s-Web-Programming-with-Python-and-JavaScript.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/css_help.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/cv.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/cvblog.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/C_Lang.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/django-docs.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/django-experience.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/DjangoAPIexe.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/djangobook.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/djangoottg.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/djangopool.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/django_tdd.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/Docker101.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/DockerFiles.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/FarmSimulator.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/FlaskApp-01.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/FlaskOnDocker.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/gitDemoCreator.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/GoPascalCompiler.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/GoStudy.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/houdini-tools.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/InterpreterTDD.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/jos.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/LogView.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/LostCitiesScore.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/matchmove-trainig.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/matplotlib101.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/maxbinaryinfo.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/MayaTools.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/messageboard.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/micropython_101.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/MicroSrvToDo.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/miniBlog.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/MonMan.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/NamingConvention.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/OpenAPI-DynamicClient.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/PascalCompiler.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/PhanGhon.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/productname.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/pullreqtest.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/pyLearn.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/PyQtExamples.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/PythonDockerEnv.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/PythonInterviewQA.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/PythonMetaProgramming.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/PythonSnippets.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/python_AST_examples.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/python_demo.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/QadreRnD.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/Questionnaire.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/quick-references.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/repowatcher.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/Retspoh.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/RnD.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/SanityCheckFramework.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/ShotgunTools.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/Studies.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/swapi.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/SysUtils.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/TDEWrapper.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/Templates.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/TMGPlatfEE.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/ToDoApp.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/tutor-01.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/tutor_02-FlaskAPI.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/vfx-unittest.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/Web-Scrape.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/XLSProcessor.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/danielforgacs/YoutubeMusicDB.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/me50/danielforgacs.git
git clone --no-checkout -v --progress --recurse-submodules https://github.com/mlkriszta/dani.git

cd ..
zip -r $cld.zip $cld