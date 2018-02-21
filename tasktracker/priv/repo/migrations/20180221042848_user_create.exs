defmodule Tasktracker.Repo.Migrations.UserCreate do
  use Ecto.Migration

  def change do
      alter table(:users) do
      modify :email, :string, null: false
      modify :name, :string, null: false
end
  end
end
