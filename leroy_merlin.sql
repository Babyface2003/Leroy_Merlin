DROP TABLE IF EXISTS Shifts;
DROP TABLE IF EXISTS Absences;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Zones;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    hire_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE CASCADE
);

CREATE TABLE Zones (
    zone_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Shifts (
    shift_id INT PRIMARY KEY,
    employee_id INT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    zone_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (zone_id) REFERENCES Zones(zone_id) ON DELETE CASCADE
);

CREATE TABLE Absences (
    absence_id INT PRIMARY KEY,
    employee_id INT,
    date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE
);

SELECT e.employee_id, e.name, SUM(EXTRACT(EPOCH FROM (s.end_time - s.start_time))/3600) AS total_hours
FROM Employees e
JOIN Shifts s ON e.employee_id = s.employee_id
WHERE EXTRACT(YEAR FROM s.start_time) = 2023
GROUP BY e.employee_id, e.name
ORDER BY total_hours DESC
LIMIT 1;

SELECT e.employee_id, e.name, COUNT(a.absence_id) AS absence_count
FROM Employees e
JOIN Absences a ON e.employee_id = a.employee_id
WHERE a.reason = 'Прогул'
GROUP BY e.employee_id, e.name
ORDER BY absence_count DESC
LIMIT 1;

SELECT z.name, SUM(EXTRACT(EPOCH FROM (s.end_time - s.start_time))/3600) AS total_hours
FROM Shifts s
JOIN Zones z ON s.zone_id = z.zone_id
GROUP BY z.name
ORDER BY total_hours DESC
LIMIT 1;

