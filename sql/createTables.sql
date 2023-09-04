drop table if exists pastes;

create table pastes 
(id serial primary key,
 title varchar(55) default null,
 description text not null,
 creation_date timestamp default current_timestamp
);

insert into pastes (title, description)
values
    ('JavaScript Basics', 'console.log("Hello, World!");'),
    ('Number Multiplication', 'const num = 5;\nconsole.log(num * 2);'),
    ('Greeting Function', 'function greet(name) {\n  return "Hello, " + name;\n}'),
    ('Array Length', 'const arr = [1, 2, 3];\nconsole.log(arr.length);'),
    ('Looping Example', 'for (let i = 0; i < 5; i++) {\n  console.log(i);\n}'),
    ('Object Properties', 'const person = { name: "Alice", age: 30 };\nconsole.log(person.name);'),
    ('Conditional Check', 'const x = 10;\nif (x > 5) {\n  console.log("x is greater than 5");\n}'),
    ('Simple Greeting', 'const greet = () => {\n  console.log("Hello!");\n};'),
    ('Rectangle Class', 'class Rectangle {\n  constructor(width, height) {\n    this.width = width;\n    this.height = height;\n  }\n}'),
    ('Color Iteration', 'const colors = ["red", "green", "blue"];\nfor (const color of colors) {\n  console.log(color);\n}'),
    ('Factorial Function', 'const factorial = (n) => {\n  if (n <= 1) return 1;\n  return n * factorial(n - 1);\n};'),
    ('Even Number Check', 'const isEven = num => num % 2 === 0;\nconsole.log(isEven(4));'),
    ('Promise Example', 'const promise = new Promise((resolve, reject) => {\n  setTimeout(() => resolve("Done"), 1000);\n});'),
    ('Personalized Greeting', 'const greet = name => `Hello, ${name}!`;\nconsole.log(greet("Bob"));'),
    ('Array Doubling', 'const numbers = [1, 2, 3, 4, 5];\nconst doubled = numbers.map(num => num * 2);\nconsole.log(doubled);');
    

select * from pastes where id = 1;

select * from pastes order by creation_date desc limit 10;