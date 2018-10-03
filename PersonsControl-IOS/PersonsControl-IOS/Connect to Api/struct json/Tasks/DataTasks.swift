//  PersonsControl-IOS
//
//  Created by Валерий Мельников on 10/3/18.
//  Copyright © 2018 Валерий Мельников. All rights reserved.
//

import Foundation
struct DataTasks : Codable {
	let tasksPerson : [TasksPerson]?
	let tasksGroups : [TasksGroups]?
	let groups : [Groups]?
	let tasksProjects : [TasksProjects]?
	let projects : [Project]?

	enum CodingKeys: String, CodingKey {

		case tasksPerson = "tasksPerson"
		case tasksGroups = "tasksGroups"
		case groups = "groups"
		case tasksProjects = "tasksProjects"
		case projects = "projects"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		tasksPerson = try values.decodeIfPresent([TasksPerson].self, forKey: .tasksPerson)
		tasksGroups = try values.decodeIfPresent([TasksGroups].self, forKey: .tasksGroups)
		groups = try values.decodeIfPresent([Groups].self, forKey: .groups)
        tasksProjects = try values.decodeIfPresent([TasksProjects].self, forKey: .tasksProjects)
        projects = try values.decodeIfPresent([Project].self, forKey: .projects)
	}

}
