const protectedExample= async (req, res) => {
    console.log("Protected route accessed");
    res.status(200).json({ message: "Protected endpoint accessed!!" });
}
export default {
    protectedExampleService: protectedExample
}