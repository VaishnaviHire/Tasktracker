defmodule Tasktracker.Repo.Migrations.UserTime do
  use Ecto.Migration

  def change do
  alter table(:users)do
timestamps()
end
  end
end
