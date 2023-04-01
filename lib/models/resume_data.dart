const String resumeDataJson = '''
{
  "first_name": "Jake",
  "last_name": "Ryan",
  "phone_number": "123-456-7890",
  "email": "email@email.com",
  "links": [
    {
      "url": "github.com/example",
      "title": "Github",
      "isChecked": true
    },
    {
      "url": "linkedin.com/in/example",
      "title": "LinkedIn",
      "isChecked": true
    }
  ],
  "sections": [
    {
      "title": "Experience",
      "type": "job",
      "components": [
        {
          "data": {
            "title": "Undergraduate Research Assistant",
            "employer": "Texas A&M University",
            "start_date": "June 2020",
            "end_date": "Present",
            "location": "College Station, TX",
            "bullets": [
              {
                "content": "Developed a REST API using FastAPI and PostgreSQL to store data from learning management systems"
              },
              {
                "content": "Developed a full-stack web application using Flask, React, PostgreSQL and Docker to analyze GitHub data"
              },
              {
                "content": "Explored ways to visualize GitHub collaboration in a classroom setting"
              }
            ]
          }
        },
        {
          "data": {
            "title": "Information Technology Support Specialist",
            "employer": "Southwestern University",
            "start_date": "Sep. 2018",
            "end_date": "Present",
            "location": "Georgetown, TX",
            "bullets": [
              {
                "content": "Developed a REST API using FastAPI and PostgreSQL to store data from learning management systems"
              },
              {
                "content": "Developed a full-stack web application using Flask, React, PostgreSQL and Docker to analyze GitHub data"
              },
              {
                "content": "Explored ways to visualize GitHub collaboration in a classroom setting"
              }
            ]
          }
        }
      ]
    },
    {
      "title": "Projects",
      "type": "project",
      "components": [
        {
          "data": {
            "title": "Gitlytics",
            "start_date": "June 2020",
            "end_date": "Present",
            "skills": [
              {
                "content": "Python"
              },
              {
                "content": "Flask"
              },
              {
                "content": "React"
              },
              {
                "content": "PostgreSQL"
              },
              {
                "content": "Docker"
              }
            ],
            "bullets": [
              {
                "content": "Developed a full-stack web application using with Flask serving a REST API with React as the frontend"
              },
              {
                "content": "Implemented GitHub OAuth to get data from user's repositories"
              },
              {
                "content": "Visualized GitHub data to show collaboration"
              },
              {
                "content": "Used Celery and Redis for asynchronous tasks"
              }
            ]
          }
        },
        {
          "data": {
            "title": "Simple Paintball",
            "start_date": "May 2018",
            "end_date": "May 2020",
            "skills": [
              {
                "content": "Spigot API"
              },
              {
                "content": "Java"
              },
              {
                "content": "Maven"
              },
              {
                "content": "TravisCI"
              },
              {
                "content": "Git"
              }
            ],
            "bullets": [
              {
                "content": "Developed a Minecraft server plugin to entertain kids during free time for a previous job"
              },
              {
                "content": "Published plugin to websites gaining 2K+ downloads and an average 4.5/5-star review"
              },
              {
                "content": "Implemented continuous delivery using TravisCI to build the plugin upon new a release"
              },
              {
                "content": "Collaborated with Minecraft server administrators to suggest features and get feedback about the plugin"
              }
            ]
          }
        }
      ]
    }
  ]
}

''';
