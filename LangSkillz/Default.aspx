<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LangSkillz._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>

        <br /><br />
        <div style=" width: 100% ;background-image: url('Image/LangSkillz_banner.png'); background-size: cover;">
            <br /><br />
            <section class="row d-flex justify-content-center" aria-labelledby="aspnetTitle">
                <div class="col-12 text-center">
                    <br /><br /><br /><br /><br /><br /><br /><br />
                    <p style="font-size: 48px; font-weight: bold; color:white;"><asp:Label ID="welcomeMessage" runat="server" Visible="false">Welcome back to LangSkillz!</asp:Label></p>
                    <p><asp:Button ID="registerButton" runat="server" Text="This is my first visit to LangSkillz" CssClass="btn btn-primary btn-md bg-success" Visible="true" /></p>
                    <p><asp:Button ID="loginButton" runat="server" Text="I already have an account" CssClass="btn btn-primary btn-md bg-info" Visible="true" /></p>
                </div>
            </section>
            <br /><br />
        </div>

        <br /><br />
        <div>
            <div aria-labelledby="1stScript">
                <h2 id="1stScript">Language Learning Made Easy!</h2>
                <img class="float-end" src="\Image\turtle.gif" width="300" height="300" style="object-fit: cover;margin-right: 150px;">
                <p class="row">
                    Welcome to LangSkillz, the language learning platform designed to make language learning easy and fun! With LangSkillz, you can learn a new language from the comfort of your own home, at your own pace, and with personalized support every step of the way.
                    <br />
                    Our platform offers a variety of interactive exercises, including listening, speaking, reading, and writing, to help you improve your language skills. We also provide personalized feedback from expert language instructors to ensure you're making progress and reaching your language goals.
                    <br /><br />
                    Learning a new language doesn't have to be intimidating or overwhelming. With LangSkillz, you'll have access to user-friendly tools and materials that are tailored to your learning style and level. Whether you're a complete beginner or an advanced learner, our platform is designed to help you achieve fluency in your target language.
                    <br /><br />
                    Sign up for LangSkillz today and start your language learning journey with ease!
                </p>
            </div>


            <br /> <hr /> <br />

            <section aria-labelledby="2ndScript">
                <img class="row float-end" src="\Image\croko.gif" width="150" height="150" style="object-fit: cover;">
                <h2 class="text-end" id="2ndScript">Join a Thriving Language Learning Community</h2>
                <img class="float-start" src="\Image\dino-chan.gif" width="400" height="400" style="object-fit: cover;margin-right: 150px;">
                <p class="text-end"> Join the LangSkilz community with Us </p>
                <p class="text-start">
                    At LangSkillz, we believe that language learning is not just about acquiring new vocabulary or grammar rules, but also about connecting with a global community of language learners and instructors.
                    <br /><br />
                    By becoming a LangSkillz member, you'll have the opportunity to connect with learners from all over the world and share your language learning journey with others. Our platform provides a space for learners to engage in discussions, exchange feedback, and share resources to help each other improve.
                    <br /><br />
                    
                    In addition, our community includes expert language instructors who are passionate about helping learners achieve their language goals. Our instructors come from diverse backgrounds and have years of experience teaching their respective languages. By learning from multiple perspectives, you'll be able to gain a deeper understanding of the language and culture you're studying.
                    <br /><br />
                    At LangSkillz, we're more than just a language learning platform – we're a community of learners and instructors who are dedicated to helping each other succeed. Join us today and become a part of our thriving language learning community!
                </p>
                <p style="margin-right:100px"><a href="Account\Register.aspx" class="btn btn-primary btn-md">Become a member of LangSkillz right now?</a></p>
            </section>

            <br /> <hr /> <br />

            <section aria-labelledby="1stScript">
                <h2 id="3rdScript">Take Your Language Skills to the Next Level</h2>
                <img class="float-end" src="\Image\SweeKorki.gif" width="400" height="400" style="object-fit: cover;margin-right: 150px;">
                <p>
                    At LangSkillz, we offer a wide range of language courses and exercises designed to help learners at all levels improve their language skills. Our courses are developed by expert language instructors and cover a variety of topics, from basic vocabulary and grammar to more advanced conversation and writing skills.
                    <br /><br />
                    Our exercises are designed to be interactive and engaging, with a variety of formats including multiple choice, fill-in-the-blank, and audio recording. You'll have the opportunity to practice all four language skills – listening, speaking, reading, and writing – in a supportive and encouraging environment.
                    <br /><br />
                    In addition, our platform includes features to help you track your progress and set goals for your language learning journey. You'll be able to see your scores on each exercise, track your overall progress, and receive feedback from our expert instructors to help you improve.
                    <br /><br />
                    Whether you're a beginner or an advanced learner, LangSkillz has something for you. Sign up today and start taking your language skills to the next level!
                </p>
            </section>

            <br /> <hr /> <br />
        </div>
    </main>

</asp:Content>
