Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1ACD1F465A
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jun 2020 20:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388313AbgFISc2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 Jun 2020 14:32:28 -0400
Received: from sonic304-20.consmr.mail.sg3.yahoo.com ([106.10.242.210]:42867
        "EHLO sonic304-20.consmr.mail.sg3.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388228AbgFIScX (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 9 Jun 2020 14:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1591727539; bh=DPYuw2gUpgtMJzJhlH/AVmRGu2wSKCY1C+f8nOCoxu0=; h=Date:From:Reply-To:Subject:References:From:Subject; b=mI2BfxIKvoDzqL5vsegJigGcjEYXXOPXeCXcBJIen7mpqXzja/75oK2ohLduCs4vVa975Y9VNjVznkK1KsLMzM4J7dS4eL5U3+0P/WKn9xhRCJPMUQSYPC16tQYBdaKb9RrjT53ZZ8QIN8hFLDdEejzL+T+XX0Iff62cT/72mR4TOGBL1d69Ij511ojXIt8Vmoa1xvF4BvM2oDhYr7FGXRMpSS1DOMT66YcxZhgZZ0PZCbESpNewl1VgNxVCek3AWIbJhEQ+tF1/QUOFwzmbU6Z5XqhabfkEtVqvbnlNcbjFbq7JWHlzZP8mSZzafDDZcIZkrYtGdPYARVGCXBrrIw==
X-YMail-OSG: wZBfVDMVM1lsD0vJTm1isaILtAgTLtsQF0_F46Byw0zdHperdjU4e5mxSAoymvE
 tlazQ4DsnLUhmSthnJrfmPfCsaqmqsUJUuVWVwRf6yEtWXfki8Td115ptIqrkGMKxTV1C_w.Krxv
 .2lElFGMVj9pFcFJJh.MtKUb4a1s200YwqTOlLGpLGpsnEBreOrnXpyEu5bWgc.g81ixdlHdVbDr
 gP0irugDkZ_3039GPJ9cwsqSU46ROC2vsLp.yes3UCkbPlsm6E2DI4KWTQsG_.iIsApURViDZahU
 eAUX6osSv4IG5bqQgZf2a9f.Xyfq_0SOh9bcjF.jRVlcjyIMava4Dm0992J.Ac5jAeFtoN.vfZqV
 60LruJALGRWBDwR7i32T9QnueOluv1nrnDPLl5pIf_rz1GJjNKBOz0QdNtPk.We1ssNMvz43pnjO
 _g3VAeve3bulelT.CV3yCs8xmneJNCIaebr33aDFH1kXVKN_DijJVeR21QScm_RG2Rl_iEhlZRdU
 ocvZX49CPt7swkcKH5NVSQ8C14mu0pCz21aEU_GT5pQjvoArM5rCW8h9.7Edd20TfNK3uQdv24FW
 d2yp11vh.Mwrhj.1_DBAMvdb3Kq7ZVZkWgj27ekTMHguNsVQC0zj1eRf5gI81VFrnRm4zHE0tV3g
 zvROU92qk44UpTCCwiISxexQnvfmBOHHqsAj3Uz84BoXAQJA_WC851m79_eb.EZWYXrivsT5R2OY
 3ws9gxTaM7pL04BV74TKamN1tE.uQ_mKgjlFaSdT7Ctuv3HCLWyNuAbsVQ4Vhg8Ewo5HytqlMlPS
 XWxbfZucAGdk1I4YlxpFfXd4XToJtg5o45qblkbRVdiC_SgkHvRptAY7jD.alpEvzw.2uOwPItuc
 Bt_IC417X99.NmP8GjFd6JPo.uEuLD0mVi8wVCicINhG5DpwGs6P5Q.mklo.Aw6k0nwgH7lh1bjQ
 RCH6rHjeHBkzmYnmgWYljmfIQqQFYjPnB0WscMyiKagxOXduw_FHj.rWQ8pqC4l6wQtVPJ2WvLkH
 kkPytfrS_XHTt2UBBCSEKF37DWVbIujQ0uh6DmLmH.0SeKoiaaElkRzzHHrojYUl5cyZ.c.f3dS.
 uVIzyjAOp29QJ0pb6ySFEcfQaqxBMjioDS5UXpGxyZCKwp8.u5PTBxS8dVWpJsF_vnbc2LR1PDti
 qYtHu5AtDcgke8c.G1ucSTU3dQ5aautsdeXmN5ryuAjlroKV6RdKR2_hRM6DJ5U1ohSpnE5UdzAV
 t1LONoLjunBbwo5T75QoVmZi4HPfaANDeGyWbspEgjMAui1rIyijajEe4fWtVdUVRhK1oxUojkzU
 tdQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.sg3.yahoo.com with HTTP; Tue, 9 Jun 2020 18:32:19 +0000
Date:   Tue, 9 Jun 2020 18:32:16 +0000 (UTC)
From:   "Mrs. Mina A. Brunel" <mrsminaabrunel2@gmail.com>
Reply-To: smrsminaabrunel63@gmail.com
Message-ID: <1794129235.1418099.1591727536313@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1794129235.1418099.1591727536313.ref@mail.yahoo.com>
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
