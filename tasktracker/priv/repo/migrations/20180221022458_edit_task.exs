defmodule Tasktracker.Repo.Migrations.EditTask do
  use Ecto.Migration

  def change do

  alter table(:tasks) do
   timestamps
end


  end
end
