drop table if exists pastes;

create table pastes 
(id serial primary key,
 title varchar(55),
 description text not null,
 creation_date date
);

insert into pastes(title, description,creation_date)
values
('purchase test', 'window.dataLayer = window.dataLayer || [];
window.dataLayer.push);', '2023-08-29'),
('html data', '<div class="container">
    <div class="card border-0" style="background-color: #C5D9F2;">
        
        <!-- Header background image (change the link inside the brackets to change the header background) -->
        <div class="card-header p-3 border-0 justify-content-center"
            style="background-image: url(https://media.discordapp.net/attachments/1145603288885112852/1146047336796143706/image.png?width=662&height=662);">', '2023-08-23');