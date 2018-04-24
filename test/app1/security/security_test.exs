defmodule App1.SecurityTest do
  use App1.DataCase

  alias App1.Security

  describe "users" do
    alias App1.Security.User

    @valid_attrs %{company_access: "some company_access", first_name: "some first_name", last_name: "some last_name", password_hash: "some password_hash", role: "some role", username: "some username"}
    @update_attrs %{company_access: "some updated company_access", first_name: "some updated first_name", last_name: "some updated last_name", password_hash: "some updated password_hash", role: "some updated role", username: "some updated username"}
    @invalid_attrs %{company_access: nil, first_name: nil, last_name: nil, password_hash: nil, role: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Security.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Security.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Security.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Security.create_user(@valid_attrs)
      assert user.company_access == "some company_access"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.password_hash == "some password_hash"
      assert user.role == "some role"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Security.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Security.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.company_access == "some updated company_access"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.password_hash == "some updated password_hash"
      assert user.role == "some updated role"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Security.update_user(user, @invalid_attrs)
      assert user == Security.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Security.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Security.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Security.change_user(user)
    end
  end
end
