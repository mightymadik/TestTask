import Foundation

class StudentPlanParser {
    static func parseStudentPlan() {
        let jsonData = """
            {
                "IUPSid": "6020fdd49607af09001d5aeb",
                "Title": "ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН СТУДЕНТА №2018-24907",
                "DocumentURL": "",
                "AcademicYearId": "1",
                "AcademicYear": "2018-2019 учебный год",
                "Semesters": [
                    {
                        "Number": "5",
                        "Disciplines": [
                            {
                                "DisciplineId": "5d762432cbbc35013c1dff3f",
                                "DisciplineName": {
                                    "nameKk": "Электрохимия (ағылшын)",
                                    "nameRu": "Электрохимия на англ. Яз ",
                                    "nameEn": "Electrochemistry"
                                },
                                "Lesson": [
                                    {
                                        "LessonTypeId": "1",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    },
                                    {
                                        "LessonTypeId": "2",
                                        "Hours": "15",
                                        "RealHours": "5"
                                    },
                                    {
                                        "LessonTypeId": "3",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    }
                                ]
                            },
                            {
                                "DisciplineId": "5d762431cbbc35013c1df220",
                                "DisciplineName": {
                                    "nameKk": "Шет тілі C1",
                                    "nameRu": "Иностранный язык C1",
                                    "nameEn": "Foreign language C1"
                                },
                                "Lesson": [
                                    {
                                        "LessonTypeId": "1",
                                        "Hours": "30",
                                        "RealHours": "30"
                                    },
                                    {
                                        "LessonTypeId": "2",
                                        "Hours": "15",
                                        "RealHours": "15"
                                    },
                                    {
                                        "LessonTypeId": "3",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    }
                                ]
                            },
                            {
                                "DisciplineId": "5d762431cbbc35013c1df2a6",
                                "DisciplineName": {
                                    "nameKk": "Химиялық анализ негіздері",
                                    "nameRu": "Основы химического анализа",
                                    "nameEn": "Fundamentals of chemical analysis"
                                },
                                "Lesson": [
                                    {
                                        "LessonTypeId": "1",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    },
                                    {
                                        "LessonTypeId": "2",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        "Number": "7",
                        "Disciplines": [
                            {
                                "DisciplineId": "5d762432cbbc35013c1dff3f",
                                "DisciplineName": {
                                    "nameKk": "Электрохимия (ағылшын)",
                                    "nameRu": "Электрохимия на англ. Яз ",
                                    "nameEn": "Electrochemistry"
                                },
                                "Lesson": [
                                    {
                                        "LessonTypeId": "1",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    },
                                    {
                                        "LessonTypeId": "2",
                                        "Hours": "15",
                                        "RealHours": "1"
                                    },
                                    {
                                        "LessonTypeId": "3",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    }
                                ]
                            },
                            {
                                "DisciplineId": "5d762431cbbc35013c1df220",
                                "DisciplineName": {
                                    "nameKk": "Шет тілі C1",
                                    "nameRu": "Иностранный язык C1",
                                    "nameEn": "Foreign language C1"
                                },
                                "Lesson": [
                                    {
                                        "LessonTypeId": "1",
                                        "Hours": "30",
                                        "RealHours": "30"
                                    },
                                    {
                                        "LessonTypeId": "2",
                                        "Hours": "15",
                                        "RealHours": "15"
                                    },
                                    {
                                        "LessonTypeId": "3",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    }
                                ]
                            },
                            {
                                "DisciplineId": "5d762431cbbc35013c1df2a6",
                                "DisciplineName": {
                                    "nameKk": "Химиялық анализ негіздері",
                                    "nameRu": "Основы химического анализа",
                                    "nameEn": "Fundamentals of chemical analysis"
                                },
                                "Lesson": [
                                    {
                                        "LessonTypeId": "1",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    },
                                    {
                                        "LessonTypeId": "2",
                                        "Hours": "30",
                                        "RealHours": "10"
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
            """.data(using: .utf8)!

        if let studentPlan = try? JSONDecoder().decode(StudentPlanParser.self, from: jsonData) {
            for semester in studentPlan.Semesters {
                print("Semester: \(semester.Number)")

                for discipline in semester.Disciplines {
                    let planHoursText = "Plan Hours: \(discipline.Lesson.reduce(0, { $0 + Int($1.Hours) ?? 0 })) hours"
                    let realHoursText = "Real Hours: \(discipline.Lesson.reduce(0, { $0 + Int($1.RealHours) ?? 0 })) hours"

                    let planColor = discipline.Lesson.allSatisfy { $0.Hours == $0.RealHours } ? "\u{001B}[0;32m" : "\u{001B}[0;31m"
                    let realColor = discipline.Lesson.allSatisfy { $0.Hours == $0.RealHours } ? "\u{001B}[0;32m" : "\u{001B}[0;37m"

                    let coloredPlanHours = planColor + planHoursText + "\u{001B}[0m"
                    let coloredRealHours = realColor + realHoursText + "\u{001B}[0m"

                    print("  Discipline: \(discipline.DisciplineName.nameRu)")
                    print("  \(coloredPlanHours)")
                    print("  \(coloredRealHours)")
                    print()
                }
            }
        } else {
            print("Failed to parse student plan data.")
        }
    }
}

func main() {
    StudentPlanParser.parseStudentPlan()
}

