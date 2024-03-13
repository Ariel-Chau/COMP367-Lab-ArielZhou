FROM openjdk:21
EXPOSE 8080
ADD target/COMP367-Lab2-ArielZhou.jar COMP367-Lab2-ArielZhou.jar
ENTRYPOINT [ "java", "-jar","/COMP367-Lab2-ArielZhou.jar" ] 
