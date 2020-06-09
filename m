Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104601F4652
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jun 2020 20:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731989AbgFIS2u (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 Jun 2020 14:28:50 -0400
Received: from sonic309-14.consmr.mail.bf2.yahoo.com ([74.6.129.124]:42493
        "EHLO sonic309-14.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730658AbgFIS2u (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 9 Jun 2020 14:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1591727328; bh=Sq0m1vvm2SZTihycyLIp46MmEaT+M4u+5ZuM67ujUHw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Nr3y20AwOg3mpLe6UyI5GuAIRBfNPAs6nUGwCL67dxCckt8Z2Z1eN+ymI5Grwj0glOwTbWnEdkDhfLkTQpgHk4eJ9sXeJOddgn9AFswLfmrC5HxC8BwVn0co4q9qigP6+5GZVC5d9WoOy5kdSMeNw6/MrQeXplHq0CtIZwmBfYJYG3PxfeZZW/7O+iZzcKHeJetw2AnryWubnMYSZSHcM6pIYhJkfMhot06FBtkxNm+HSp9S3nCezpcA/PmSOIgrpEMi3qcDeT7DpZsWgb9AlLLW+5uifQ1+E8sW+c1cQFNcGjwDWUwE+nt9jX01b1usoH2clCYzQMs/PedmoX0Amw==
X-YMail-OSG: fUoTHGsVM1m9.edCxT9EbOaf3wt062fK2ERKy2_DbALGkQP39N.LbPjclNZMuJD
 tL6caQOKNNDRqNTaagCZ1eUeAfoQgbWB1FfyqBxs_d0hrTGoKug5VTart_QsfmpUuqeuO32O31Oi
 8WsaXvnZwWjSvLn48L31fBorjiWc6MUrXo5jQCxuqjdu6HU4jO8gNz0jyXPXdoLQSUOw5mKnXFSJ
 sqtR0R9XLvmy3N8kNDeLOYzgFakWHXUn2eruaEH7NBb.8MheDHhHqOeasrRw0jRhVicxhuW9v2Lp
 MlxHqqkEqanQ2lgb3FY27fXjH4MyHjUgQULWN85n2dgBlP4DNkX9pj43TKSXbKs0b_NQZ6Wx5yLL
 fLyqAoECywaIIFxW6U84hTbuVqB.yRNYFo9DSt4RtvK2KVAFgaNzM1BSiJbaK7xGuGgSO3HYgRLC
 4TfWrrgItN9lU0nJIsz5wVR5JkHw_ngKjXwCQsQGaVLqbJTw547gOvHHv8z0qShXdBYP3z8MeOw8
 JMPwE6e2SqXOtaTKM1xm5zExId2Ia6oTKTT46kRl60AlKo2o5ne9tQcM2OIR6I07tG7k5bXFurTi
 BGcbKDFOyzO_IyoGZiILfsdZr7C5x.JztyZqaH2zq0K6Y.x2jZSM83KYL8FrF7QUJxD.kX7IlGvO
 4HqELz4Z4avrYJw9hpRxIueMFfWQ7e6G2Bjyb.2CYf1kd9lg8Gq43enDLiYCN.dw9ptKqbNfIGcW
 Sal_2ml2XQcrrC7GkJ.tAMym.j.b4ZeGkxA2SNckQTMXez7isZxvnAHIkRQSJxCO88Ml_4jYB_.r
 vPXFPGjNFqQqtzdeHIlp4cgczo_VG8kRGy6e1slB_uFh07fW_SKNEB3pgyBa3zyaAdHPAZAgLOJa
 MrjXcIyQLyHvbz8nuuQFKJhOJdmOE5RMIwfgaF17J3x8vAhCUEP129vXQ1g3VkaA1.1S_aZls08K
 XYOE.VVSMglhoq0qTtDAm6PgH8N2_MsqmjbEAsNje39l_bJ6RWNGr6.LQPKBE9acQOJfw1SpZ9vq
 9x9QBn42_w7NKJJZl5bJyZPxBNg._w6QxOMP2SoQLNMv9nnMdSzNc87BLAS8AkhTLwHxpwZpXk2b
 rxOAf8C0Ydu.JDRbL8macIWx8GwrjCNRK_xmSTJ5Lf0qtEcEGPinhJ8SSWzOvVepDze_xXQJgfOD
 uLrLGo7sZJJRYrFCCxEMcLLNFyrQ9TbvbiY3XzYGVYcwsV9ILmf7kc0a0M1XWXhNonEFLv2HMI2z
 lgQ1u3gAhta233vngVYQhU7S3FQRUxwmAlabtZMvvztb.AWnhF_93upXSjwjWJFlHKstnVmo5PHg
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Tue, 9 Jun 2020 18:28:48 +0000
Date:   Tue, 9 Jun 2020 18:28:48 +0000 (UTC)
From:   "Mrs. Mina A. Brunel" <annahbruun6@gmail.com>
Reply-To: mrsminaabrunel63@gmail.com
Message-ID: <1531292104.1215879.1591727328053@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1531292104.1215879.1591727328053.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16072 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



My Dear in the lord


My name is Mrs. Mina A. Brunel I am a Norway Citizen who is living in Burki=
na Faso, I am married to Mr. Brunel Patrice, a politicians who owns a small=
 gold company in Burkina Faso; He died of Leprosy and Radesyge, in year Feb=
ruary 2010, During his lifetime he deposited the sum of =E2=82=AC 8.5 Milli=
on Euro) Eight million, Five hundred thousand Euros in a bank in Rome the c=
apital city of Italy in Southern Europe. The money was from the sale of his=
 company and death benefits payment and entitlements of my deceased husband=
 by his company.

I am sending you this message with heavy tears in my eyes and great sorrow =
in my heart, and also praying that it will reach you in good health because=
 I am not in good health, I sleep every night without knowing if I may be a=
live to see the next day. I am suffering from long time cancer and presentl=
y I am partially suffering from Leprosy, which has become difficult for me =
to move around. I was married to my late husband for more than 6 years with=
out having a child and my doctor confided that I have less chance to live, =
having to know when the cup of death will come, I decided to contact you to=
 claim the fund since I don't have any relation I grew up from an orphanage=
 home.

I have decided to donate this money for the support of helping Motherless b=
abies/Less privileged/Widows and churches also to build the house of God be=
cause I am dying and diagnosed with cancer for about 3 years ago. I have de=
cided to donate from what I have inherited from my late husband to you for =
the good work of Almighty God; I will be going in for an operation surgery =
soon.

Now I want you to stand as my next of kin to claim the funds for charity pu=
rposes. Because of this money remains unclaimed after my death, the bank ex=
ecutives or the government will take the money as unclaimed fund and maybe =
use it for selfishness and worthless ventures, I need a very honest person =
who can claim this money and use it for Charity works, for orphanages, wido=
ws and also build schools and churches for less privilege that will be name=
d after my late husband and my name.

I need your urgent answer to know if you will be able to execute this proje=
ct, and I will give you more information on how the fund will be transferre=
d to your bank account or online banking.

Thanks
Mrs. Mina A. Brunel
