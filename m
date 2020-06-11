Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775AF1F659F
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Jun 2020 12:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgFKKYt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 11 Jun 2020 06:24:49 -0400
Received: from sonic309-13.consmr.mail.bf2.yahoo.com ([74.6.129.123]:38708
        "EHLO sonic309-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727041AbgFKKYt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 11 Jun 2020 06:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1591871088; bh=DPYuw2gUpgtMJzJhlH/AVmRGu2wSKCY1C+f8nOCoxu0=; h=Date:From:Reply-To:Subject:References:From:Subject; b=XIquYtgOrc6x7YAAKimsO8sHNksVW5A3DSMTtTU4jhIsgSwTstgqQy0u4c0Vazgt14xf1McdQrZdJP+yEzo1DLkdCkACo/crDoCDb5S7ssNnsQSnyesT3ZPf2rajRyWx3DsFm2IrA6lwUEYOQUGEx8/sUu5BZhJy62KC47sq6NgujhwfvwyyynO6lXHL5QnO7SZdH/OsaG2UReWTM77cqjpZq3F9a16c82Hmn3uae1jPckXzAjnPZT12DHPYTDn4GkkYFwvyVViUKwnodYX/IkiIGIFwU+gHwxVSEKdCiIjGYXyGTU9wBj2URxAN0vKVSB240wNJbUGx0+fPMFoLwQ==
X-YMail-OSG: WHEE9UUVM1nKzco59p8aGZ2eNP3oecUDiJ_3GxK3MdZjVL85r.jZH3vgcrctS5T
 Qg1SMNwhHB.p7zWRm.pYAyAprwhJGNqdUpsBFqaa1InOlZ7MTwYdULLpuxvuS7Ktw2knHQzzSQhB
 2c6aIMRZt9Oo8ujxMw_Yda6Dns7ZXQOZjMlq95J.2HqEAksmODkqrWy6rqEJetkU5gs9Q43yhNO.
 XgsLfqkCKe3PMT6CmLLKTwXrK6YC8nbJU2qZblvqUGMjYGc0GhBLjEIsRSbCYQoA60ZmjtYppzCh
 hheeDBlV2RFPFWjmSr9HLNbUbdXqW3sPX0BV_g4QqcvjUCry6Wz4QgHsL8WwO.6.s9QUAkqw03wQ
 QF_1O7FfElt5bRmRMnpMOr4t4zl24ugIsjBGi0ZdkfO1ZyqDIG5sC94DsPNTf1X7c_9fNLu.oPIE
 8ZNf8n8OEq0d0gedt6AgOjDD0rJb5EPFUZYFuwOHZGCs8WIr7zteCapZgRFXY05ZyxIgVdyw_al0
 P1PhFPzErWkvbhU8nBCbN.dEw5Et1SWlGPhtgpLqSh4Pah5HLgi6ugoyJ3pnRtsBM5PLtNnZBTX3
 Iuyp6tIQvygNepuGPbZjIHhlWxRnk4CVjwB5o2kV8x11L_VcIRea0c4I21sIgk0gWHBtrHtT1XVv
 kGgM7dZVjBejVoZbF7vKpQYRVIzZ1e6N87_rc1XlNKqgpTV9OoPhreBcQ9zFdV6uaSH_DPg5Feiu
 3cISGSw2aD8kDYIsx2YIuYCxv45u3uo4n656sZI14wXr_O0vaf9LvkoUTUYwknMzpB2ynO8KFiUA
 w31b1.o3IpTa7Bul2VyO6FF7x8F_O.rYvFUyWCTYAuIzlHTt..t78vTtZJywWOdGtqZXrtOPWVci
 jnoMU754X7.7zCrjFUG7z7vwSn.TEI8lDV.eLE0wSTGOAp2zJ0KDU.R04V73P.ypRrihU.g_pVgN
 N52ZE0X16p1_v8HGkJUoxyodyMG2h93_wl2.uZDUvjkdMj_fAGTV0GIfilz1J3AIuC42Qu7oysiU
 OqXF6evFFgJ0nZ9g7W80Ko6uWAvH.yJSBDQJ7WRnQglk.EAkFBvCDyHuKPuTUwq4SebfXcRNCOSp
 cBlr0gWkdb0LPPiu882hv2pXQJYHAeA8fktMxPZ.ztwbdoY8HiJW2ZOFcAlskDoWU9F46_Qxjr_1
 ejIlq8DHjtSgO4eIULrf4M9msI41dY8GHDhu_a.Bub02LxDPcCxryLTVpwi9KpIgvoCNiHLXme.a
 w.ertjij6GOAOq1LBj1cvs3LuIJz4lGGEXNPg8EGX548TDDWo2pvBLM5H4U37dcGz05kDWAMdVQ-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Thu, 11 Jun 2020 10:24:48 +0000
Date:   Thu, 11 Jun 2020 10:24:47 +0000 (UTC)
From:   "Mrs. Anna H. Bruun" <mrsannah913@gmail.com>
Reply-To: mrsminaabrunel63@gmail.com
Message-ID: <2078425762.1081874.1591871087635@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <2078425762.1081874.1591871087635.ref@mail.yahoo.com>
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
on Euro) Eight million, Five hundred thousand Euros in a bank in Ouagadougo=
u the capital city of of Burkina in West Africa. The money was from the sal=
e of his company and death benefits payment and entitlements of my deceased=
 husband by his company.

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
