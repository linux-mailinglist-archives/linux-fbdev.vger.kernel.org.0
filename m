Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479D97E172C
	for <lists+linux-fbdev@lfdr.de>; Sun,  5 Nov 2023 23:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjKEWAb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 5 Nov 2023 17:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbjKEWAa (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sun, 5 Nov 2023 17:00:30 -0500
X-Greylist: delayed 5219 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:00:27 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD185EB;
        Sun,  5 Nov 2023 14:00:27 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id A9C7F1938A;
        Mon,  6 Nov 2023 01:57:49 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id A2E061933F;
        Mon,  6 Nov 2023 01:57:49 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 37AE51B82534;
        Mon,  6 Nov 2023 01:57:51 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id NhImikRw-DAy; Mon,  6 Nov 2023 01:57:51 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 0680F1B824EE;
        Mon,  6 Nov 2023 01:57:51 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn 0680F1B824EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210671;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=NRksUFdgaZRJCp4Bch3+EHt2SeiXB2LMeXprCPoMenLKYFqLjsbyvddeHe7JV8ER0
         DU/f1Ycl1XJ0bMPvtMfmcOiEGKFXQz+mqrpkc/QpJK5W4DzDwBasV9f1Xp8VY+91Eq
         87a3hoesv1YcUP8V3A+HMboJ9rYR9slHQOOGxSSnMQN/52TR1Ac1CoZn2FKrEJEuB7
         jghDlv+m93SE2uZyur9FN7cVYhs21+A4QPhjtdrYFi6vtO1L5JDscWOylRDHI0Rl6W
         J0GN1QVRjlgw9GH6iIRPWrtdhxXMHjcc1SRU9QOEBFHic6o01h0d32+1pfDZHbXzm9
         +FC+GM0Hz4o7Q==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 7_mdhKBXJ9E6; Mon,  6 Nov 2023 01:57:50 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id 909C81B8250D;
        Mon,  6 Nov 2023 01:57:44 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:57:34 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185744.909C81B8250D@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

