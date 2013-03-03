var parent_node = $('#organ_tree').tree('getSelectedNode');
$('#organ_tree').tree(
  'appendNode',
  {
    name: "<%= @organ.name %>",
    url: "/unirole/users?page=1&organ_id=<%= @organ.id %>"
  },
  parent_node);
