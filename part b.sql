select total ,group_concat(NOC)
FROM medalcount
group by 1
having count(*) > 1;
