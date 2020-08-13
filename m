Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCC724379F
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Aug 2020 11:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgHMJZj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Aug 2020 05:25:39 -0400
Received: from sonic310-13.consmr.mail.bf2.yahoo.com ([74.6.135.123]:38169
        "EHLO sonic310-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726072AbgHMJZi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Aug 2020 05:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1597310737; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=lMNb8RV+yYaYEtSJCrF2dlSzjK1cyMe0V4PrAQEe2pE/CbPkX4ho1IPsrGtmhW0nyMF4S3+wlQ5voOr5dzLd02amyBLaoYuRL5xZVxWkabLEu7MxKn6ylf/UjkAhxzimlf8PQPOSxjMIxptWw+JlKlJhlT1BxQwAeIOj5BsvX1e0H4wLJzbGz+jDBtk/rb4Ra2UWuvrdoY9046xmb1Ml4tOEMr6ZaZr5Q2vzMRDrS2j3p4VvQJ/B6Y1EfRzp+CRiG6nnnjK6dtV3Eix1/uuNp55l0jRsbCiwfYez9vN65yIE8WGurmIpygryNa82sTOy66W/fmPPSz7n1BrulW9Gag==
X-YMail-OSG: lGkJ.hwVM1nnjD7txpfShrUg4HANs7bI6OWqENhzhw_r0N7P171knK9D.hp0rgD
 1XGq4WqwfGvm5Kgzvw_xN11iu3w1V_oDKsMJTTX0bxcxAJ6t16jA4G6SF8swOO9PelgRAkrD3TcY
 7dRkuc23fZecUzZ6_jRgxafQXVGkzmXzfikcQ9flNWBGsM6lUNj4x8QAW5e31djn0Un9zEs0OL6i
 ismMlmM48FiXG9Cgvs7f3H8XmGZlP5_vccYO5igHrnYcn780YGcGpqOhmgYXAW6KLxR6p7gCNA05
 uJfh.pXfYkTaYDCtXX0Qbcln.0Ma39htFfCbmrkQqzhkZEb_ql67nz7jDwWlFHVrj7NTCMdYBgz3
 ACWvRNlnIW2OLMjO_xbi89ORU80Hlvljorwc1Lh1wqIy7sFDL52mqHDjnOaaAK6RLeo0pT.Yt_Cu
 VVlGV8vE6yIqWp3uCfNNdA5KF6wAxJ8YnTmQ.6Di6JJr.40.aXFlBPU549QrEQTjBDMKvhYMSrYX
 U7g5uwByt08RlABqDGw2fFSEx3K_4xryG2X.bi0TaDLMs1F6lzhGmw0Dzn.XXTtqaSBN7wmnrsBZ
 kG5q7Ei73g2W1GrwjupkdRvwARKqjF2BLGvMcWk1MwYFfTc.93dPtyOCf7jGQxkXPhdrW6LxY4tD
 6rxMF3XD13Kt3DyE2M6wLJuk3M4C2jnIMxLX0yvVMpFyUrpBfvksQfGJNfyHWN4MDVROaJvJLdr9
 5.9dWBrQy.d0csGOasANjGmPeDu.BL1B01SM7nrou0GaNGBe4FxaoJWNSQUcWKPXwSHq4HVKCbXb
 EB6Hm4CAycoqxj.qn3gTje8M8I7_5PoCdi7kszhQogmHRgWEjK5PdjTASnaWTnK.DEnk8uoblcJU
 K9hT8npJUsBH3XgkJFSMk979bGpXDrbzUT9X.DlU8.fUgeo9t24iDXNsjRgOyIGlN_sOdT1ik5xk
 8n6qeh.d9rtgbSG7wauUR43FnmL.KPrBEdV4kYiPEb2nXUB6aSWoFTMmcQ5FF3iM5OaVABJApAeK
 iOZm_4aDXCa7SIAgI9JwZvWpqSUhtlaihgqTlrMjLIeT65gfqJFC8RM4HwZ3xN2behAdUk4Z4l8O
 cCU8nMFI5Lj9viYWq8YQjMZFrPOr6_wOczvqYJT4TgO6Ov1mo_3aj4qbKaha1J_Bp0XHi0Mmixqm
 Qj_ux0qLobtnmdxxV207o0uSGNWmZzn4oSLrUWZKZDtZIndmmenEyqxfZkL6G5Ra_pKeMo7xn7eT
 kC2_cGhgdgdATChzITD7m6Ju4m81pSfth9fbqUsl9FvLa1F7qtkRTovLE8Vwjs7tUGBFcIKncOvs
 2rensGTxOxhQABHN95MB_EWAQK8YxBZ067il1VAEIYdWICRk-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Thu, 13 Aug 2020 09:25:37 +0000
Date:   Thu, 13 Aug 2020 09:25:37 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh111@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1652134774.998311.1597310737469@mail.yahoo.com>
Subject: YOUR CO-OPERATION FOR THIS BUSINESS(Ms Lisa hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1652134774.998311.1597310737469.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16455 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:79.0) Gecko/20100101 Firefox/79.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Dear Friend,

I am Ms Lisa hugh, work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me for success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa hugh.
