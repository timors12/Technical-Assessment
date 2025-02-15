// import React, { useEffect, useState } from "react";
// import axios from "axios";

// function App() {
//   const [message, setMessage] = useState("Loading...");

//   useEffect(() => {
//     axios.get("http://localhost:5000/api/message")
//       .then(response => setMessage(response.data.message))
//       .catch(error => setMessage("Error fetching message"));
//   }, []);

//   return (
//     <div style={{ textAlign: "center", marginTop: "50px" }}>
//       <h1>{message}</h1>
//     </div>
//   );
// }

// export default App;
    
    // In the code above, we are using the  useEffect  hook to fetch the message from the server when the component mounts. We are using the  axios  library to make the HTTP request. 
    // The message is displayed in the  h1  element. 
    // Now, we need to update the  App.js  file to use the  BrowserRouter  component from  react-router-dom  to enable routing in our application. 
    // Replace the contents of the  App.js  file with the following code:


    import React, { useEffect, useState } from "react";

function App() {
  const [message, setMessage] = useState("Loading...");

  useEffect(() => {
    fetch("http://127.0.0.1:5000/api/message")
      .then((response) => response.json())
      .then((data) => setMessage(data.message))
      .catch((error) => setMessage("Error loading message"));
  }, []);

  return (
    <div className="flex h-screen items-center justify-center bg-gray-100">
      <h1 className="text-3xl font-bold text-gray-800">{message}</h1>
    </div>
  );
}

export default App;
