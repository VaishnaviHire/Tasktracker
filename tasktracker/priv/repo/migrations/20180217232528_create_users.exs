
defmodule Tasktracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    alter table(:users) do
    modify :email, :string, null: false
   modify :name, :string, null: false
   timestamps()
  
  end
end
end
