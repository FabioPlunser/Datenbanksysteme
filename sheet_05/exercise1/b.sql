CREATE TABLE IF NOT EXISTS employee(
    employee_id UUID NOT NULL DEFAULT gen_random_uuid(),
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    main_location VARCHAR(255) NOT NULL,
    PRIMARY KEY(employee_id)
);
CREATE TABLE IF NOT EXISTS project(
    project_id UUID NOT NULL DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    main_location VARCHAR(255) NOT NULL,
    PRIMARY KEY(project_id)
);
CREATE TABLE IF NOT EXISTS working(
    employee_id UUID NOT NULL,
    project_id UUID NOT NULL,
    start_date DATE DEFAULT now() NOT NULL,
    PRIMARY KEY(employee_id, project_id),
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY(project_id) REFERENCES project(project_id)
);