create or replace function canPickColor(nnode int)
returns boolean as
$$
declare
  can_pick boolean;
  neighbour int;
begin
  for i in 1..3 loop
    can_pick := True;
    for neighbour in (select target from Graph where source=nnode union select source from Graph where target=nnode) loop
      if i = (select color from node_colors nc where nc.node = neighbour) then
        can_pick := False;
      end if;
    end loop;
    if can_pick then
      update node_colors set color = i where node = nnode;
      return True;
    end if;
  end loop;
  return False;
end;
$$ language plpgsql;

create or replace function threeColorable()
returns boolean as
$$
declare
  nodes int[];
  can_pick_color boolean;
begin
  nodes := (select array(select source as node from Graph union select target from Graph order by 1));
  drop table if exists node_colors;
  create table node_colors (
    node int,
    color int
  );
  insert into node_colors select node, -1 from (select unnest(nodes) as node) q;

  for i in 1..array_length(nodes, 1) loop
    can_pick_color := (select canPickColor(nodes[i]));
    if not can_pick_color then
      return False;
    end if;
  end loop;
  return True;
end;
$$ language plpgsql;

select threeColorable();
table node_colors;

-- delete from node_colors;
-- insert into node_colors select node, -1 from generate_series(1, 5) as node;
-- table node_colors;
-- select canPickColor(1);
-- table node_colors;
-- select canPickColor(2);
-- table node_colors;
-- select canPickColor(3);
-- table node_colors;
-- select canPickColor(4);
-- table node_colors;
-- select canPickColor(5);
-- table node_colors;
