from cs50 import SQL

# Establish a connection to the database
db = SQL("sqlite:///dont-panic.db")

# Prompt the user to enter a new password
password = input("Enter a new password for the administrator: ")

# Execute the SQL statement to update the administrator's password
db.execute("""
    UPDATE users
    SET password = ?
    WHERE username = 'admin';
    """,
    password
)

print("The administrator's password has been updated.")
