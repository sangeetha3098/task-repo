const database = [];

const registUser = (e) => {
  e.preventDefault();

  const username = document.getElementById("name").value;
  const useremail = document.getElementById("email").value;
  const userpassword = document.getElementById("password").value;
  const registerData = document.getElementById("registerData");

  if (username === "" || useremail === "" || userpassword === "") {
    alert("Please Fill all the fields");
    return;
  }

  const userData = { username, useremail, userpassword };

  const checkEmail = database.find((e) => e.useremail === useremail);
  // console.log('checkEmail',checkEmail);

  if (checkEmail) {
    alert("Email id already used");
    return;
  }

  database.push(userData);

  console.log(database)

  alert("Registered Successfully");

  registerData.reset();
};

const loginData = (e) => {
  e.preventDefault();

  const useremail = document.getElementById("loginemail").value;
  const userpassword = document.getElementById("loginpassword").value;
  const loginData = document.getElementById("loginData");

  console.log("database", database);
};
