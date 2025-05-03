
import User from "../model/User.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export const saveUser = async (req, res) => {
  const { username, password, email } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);

  try {
    const savedUser = await User.create({
      username,
      password: hashedPassword,
      email,
    });
    res.status(200).json({ message: "User registered successfully" });
  } catch (error) {
    console.error("Error saving user", error);
    return res.status(500).json({ message: `Error saving user: ${error}` });
  }
};

export const loginUser = async (req, res) => {
  const { username, password } = req.body;
  try {
    const user = await User.findOne({ where: { username } });
    if (!user) {
      return res.status(400).json({ message: "User not found" });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ message: "Invalid password" });
    }

    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, {
      expiresIn: "24h",
    });

    return res.status(200).json({ message: "Login successful", token });
  } catch (error) {
    console.error("Error logging in user", error);
    return res.status(500).json({ message: `Error logging in user: ${error}` });
  }
};