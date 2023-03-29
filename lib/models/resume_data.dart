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
      "isChecked": true,
      "components": [
        {
          "isChecked": true,
          "data": {
            "title": "Undergraduate Research Assistant",
            "employer": "Texas A&M University",
            "start_date": "June 2020",
            "end_date": "Present",
            "location": "College Station, TX",
            "bullets": [
              {
                "content": "Developed a REST API using FastAPI and PostgreSQL to store data from learning management systems",
                "isChecked": true
              },
              {
                "content": "Developed a full-stack web application using Flask, React, PostgreSQL and Docker to analyze GitHub data",
                "isChecked": true
              },
              {
                "content": "Explored ways to visualize GitHub collaboration in a classroom setting",
                "isChecked": true
              }
            ]
          }
        }
      ]
    },
    {
      "title": "Projects",
      "type": "project",
      "isChecked": true,
      "components": [
        {
          "isChecked": true,
          "data": {
            "title": "Gitlytics",
            "start_date": "June 2020",
            "end_date": "Present",
            "skills": [
              {
                "content": "Python",
                "isChecked": true
              },
              {
                "content": "Flask",
                "isChecked": true
              },
              {
                "content": "React",
                "isChecked": true
              },
              {
                "content": "PostgreSQL",
                "isChecked": true
              },
              {
                "content": "Docker",
                "isChecked": true
              }
            ],
            "bullets": [
              {
                "content": "Developed a full-stack web application using with Flask serving a REST API with React as the frontend",
                "isChecked": true
              },
              {
                "content": "Implemented GitHub OAuth to get data from user's repositories",
                "isChecked": true
              },
              {
                "content": "Visualized GitHub data to show collaboration",
                "isChecked": true
              },
              {
                "content": "Used Celery and Redis for asynchronous tasks",
                "isChecked": true
              }
            ]
          }
        }
      ]
    }
  ]
}
''';
