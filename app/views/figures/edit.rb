<form action="/figures/<%= @figure.id %>" method="POST">
  <input type="hidden" id="hidden" name="_method" value="PATCH">
  <label for="name">Name</label>
  <input type="text" id="figure_name" name="figure[name]" value="<%= @figure.name %>"><br>

  <label for="landmarks">Landmarks</label>
  <% @landmarks.each do |l| %>
    <label><%= l.name %></label>
    <input type="checkbox" name="figure[landmark_ids][]" value="<%= l.id %>" id="<%= l.name %>" <%='checked' if @figure.landmarks.include?(l) %> >
  <% end %><br>

  <label>Add new landmark:</label>
  <input type="text" id="new_landmark" name="landmark[name]"><br>

  <label for="titles">Titles</label>
  <% @titles.each do |t| %>
    <label><%= t.name %></label>
    <input type="checkbox" name="figure[title_ids][]" value="<%= t.id %>" id="<%= t.name %>" <%='checked' if @figure.titles.include?(t) %> >
  <% end %><br>

  <label>Add new title:</label>
  <input type="text" id="new_title" name="title[name]"><br>

  <input type="submit" value="Edit Figure">
</form>
