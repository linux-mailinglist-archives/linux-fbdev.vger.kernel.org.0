Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BAEE5299B8
	for <lists+linux-fbdev@lfdr.de>; Tue, 17 May 2022 08:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbiEQGrJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 17 May 2022 02:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiEQGrH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 17 May 2022 02:47:07 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3813366AA
        for <linux-fbdev@vger.kernel.org>; Mon, 16 May 2022 23:47:04 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2ff1ed64f82so26041167b3.1
        for <linux-fbdev@vger.kernel.org>; Mon, 16 May 2022 23:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=dcwrPtXldcZQuaUTRubP/TsWaJ05MpxYEGzdke58B18=;
        b=R9qVwZDVZYgr/idFDWYCCs4gn13+kzMPeII1mwEb40ID9CwNMVHHJDtxSlN9gA4rNN
         Jg3KRSrDeaTopIxTwrZpUKvESYUHpu7XssuML7jncRc9myqHIK0RwCZ2YuK/tsixgVQR
         CJlariUNY8Hp/F2bewVvnG+hZbgAFGN9LaxfOYaaWE1gtnSPsUEof6AMuR/x8OWTXpVC
         IQ4hOtC+5/KnwErPJVr/uNBqQ7W1rddcxMjlRdxedh7CjCuol25dFXwMOaIyaB++eieh
         Yq7WvF11pMKTJZHR+QrAN0zRi4chAlGa2bmNo2rE21ohJE/RHZdG/2JIaAJ1sbIwZCGz
         faNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=dcwrPtXldcZQuaUTRubP/TsWaJ05MpxYEGzdke58B18=;
        b=oSz7MoyqgbK5pwhPsHHa5MdRcgRRYRqiSoFpeHdJSvO2UxEv9uZcdUmH+vV9kfBHpA
         00fhIH2ROCs8YCmg7UQH78rvMGXwRKIVVuMJcwowJ9MBvjL9MiWoVEfOetnj3AyvUQ5C
         ACq7+kcTCbzbal6a5joX6tIcjhV0/FJ2IXOujHZ6hoS3l2yUh235F3QI3jJkud6QN5Bw
         bOjzavOgwQxswJZyb9CzqxNOBgOLvSZZuTUfiRpftoYl2nqyL/iMkp7pwl1uwR8/rYeg
         OBdOon8KRyiafiIm69+WmyGd0buTXXwGgdHpQryM89a5b8en/CVx8Htntn0JLMI72Pgt
         QgWw==
X-Gm-Message-State: AOAM53096gbMubIsaPhUEc5qBpvkW+hK0Yi9ExsNJQ807SisO1AFOwth
        zTqugRkyFcJsdP+AKhdjEQbivBaGLMYEyvDckj0=
X-Google-Smtp-Source: ABdhPJwGwaIOEHhvcWJ1RqyYzYrzMSYh9fY2k41W46wFVU01ppFRMr69KIDMRBrcd0jbxFjpYETwzeFx76DGz5zDrCY=
X-Received: by 2002:a81:71c2:0:b0:2fe:c534:ddcf with SMTP id
 m185-20020a8171c2000000b002fec534ddcfmr19440085ywc.252.1652770023542; Mon, 16
 May 2022 23:47:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:8191:b0:179:888e:1844 with HTTP; Mon, 16 May 2022
 23:47:03 -0700 (PDT)
Reply-To: mrscecillelettytanm@gmail.com
From:   "Mrs.cecille Letty Tan" <kabiroubagna@gmail.com>
Date:   Mon, 16 May 2022 23:47:03 -0700
Message-ID: <CAP-q6B3YJgMEUzLf66LxSMm3eKs_YpaNEOZK1ed8dF47Ec_9MA@mail.gmail.com>
Subject: Hello
To:     kabiroubagna@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

How are you doing today, I hope you get my message urgently, please.
