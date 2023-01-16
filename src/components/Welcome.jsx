import ProfileImage from "../img/small-profile.jpeg"

export default function Welcome() {
  return (
    <>
      <div className="wrapper">
        <h1>Welcome To My App</h1>
        <p>This is going to be the coolest app in the world!</p>
        <img src={ProfileImage} alt="Profile Image" width={200} height={200} />
      </div>
    </>
  )
}